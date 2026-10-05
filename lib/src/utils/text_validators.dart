/// Pure Dart input string validators (headless, independent of BuildContext or UI).
abstract final class TextValidators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Validates standard email address formats.
  static bool isValidEmail(String? value) {
    if (value == null || value.trim().isEmpty) return false;
    return _emailRegExp.hasMatch(value.trim());
  }

  /// Validates minimum password length requirement.
  static bool isValidPassword(String? value, {int minLength = 6}) {
    if (value == null) return false;
    return value.length >= minLength;
  }

  /// Validates that a string is non-null and not empty after trimming.
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
}
