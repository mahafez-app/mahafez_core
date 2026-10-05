import '../enums/wallet_provider.dart';

/// Utilities for parsing, normalizing, and validating Egyptian mobile phone numbers.
abstract final class EgyptianPhoneNumber {
  static const int mobileNumberLength = 11;

  static const Map<String, WalletProvider> _prefixToProvider = {
    '010': .vodafoneCash,
    '011': .etisalatCash,
    '012': .orangeMoney,
    '015': .wePay,
  };

  /// Normalizes Egyptian phone number representations:
  /// - Strips non-digits
  /// - Converts international prefixes: `+2010...` or `002010...` -> `010...`
  /// - Converts 10-digit formats missing leading zero: `10...` -> `010...`
  static String normalize(String phoneNumber) {
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.startsWith('0020') && digitsOnly.length == 14) {
      return '0${digitsOnly.substring(4)}';
    }

    if (digitsOnly.startsWith('20') && digitsOnly.length == 12) {
      return '0${digitsOnly.substring(2)}';
    }

    if (digitsOnly.startsWith('1') && digitsOnly.length == 10) {
      return '0$digitsOnly';
    }

    return digitsOnly;
  }

  /// Attempts normalization, returning `null` if the input is not a valid mobile number.
  static String? tryNormalizeMobile(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return null;
    }

    final normalizedPhoneNumber = normalize(phoneNumber);
    if (!isValidMobileNumber(normalizedPhoneNumber)) {
      return null;
    }

    return normalizedPhoneNumber;
  }

  /// Checks if a normalized or raw phone number corresponds to a valid Egyptian mobile carrier.
  static bool isValidMobileNumber(String phoneNumber) {
    final normalizedPhoneNumber = normalize(phoneNumber);
    if (normalizedPhoneNumber.length != mobileNumberLength) {
      return false;
    }

    return _prefixToProvider.containsKey(normalizedPhoneNumber.substring(0, 3));
  }

  /// Resolves the primary telecom wallet provider for the mobile number.
  static WalletProvider? primaryProvider(String phoneNumber) {
    if (!isValidMobileNumber(phoneNumber)) return null;

    return _prefixToProvider[normalize(phoneNumber).substring(0, 3)];
  }

  /// Returns the set of eligible providers for a phone number (e.g. carrier wallet + InstaPay).
  static Set<WalletProvider> allowedProviders(String phoneNumber) {
    final provider = primaryProvider(phoneNumber);
    if (provider == null) return const {};

    return {provider, .instaPay};
  }

  /// Formats for display: e.g. "01030096242"
  static String formatForDisplay(String phoneNumber) {
    return normalize(phoneNumber);
  }
}
