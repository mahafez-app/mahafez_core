import 'package:mahafez_core/mahafez_core.dart';
import 'package:test/test.dart';

void main() {
  group('EgyptianPhoneNumber Tests', () {
    test('normalizes standard 11-digit mobile number', () {
      expect(EgyptianPhoneNumber.normalize('01030096242'), '01030096242');
    });

    test('normalizes international format with +20 prefix', () {
      expect(EgyptianPhoneNumber.normalize('+201030096242'), '01030096242');
    });

    test('normalizes international format with 0020 prefix', () {
      expect(EgyptianPhoneNumber.normalize('00201030096242'), '01030096242');
    });

    test('normalizes 10-digit number missing leading 0', () {
      expect(EgyptianPhoneNumber.normalize('1030096242'), '01030096242');
    });

    test('identifies valid mobile carriers correctly', () {
      expect(EgyptianPhoneNumber.isValidMobileNumber('01012345678'), isTrue);
      expect(EgyptianPhoneNumber.isValidMobileNumber('01112345678'), isTrue);
      expect(EgyptianPhoneNumber.isValidMobileNumber('01212345678'), isTrue);
      expect(EgyptianPhoneNumber.isValidMobileNumber('01512345678'), isTrue);
      expect(EgyptianPhoneNumber.isValidMobileNumber('01912345678'), isFalse);
    });

    test('maps prefix to correct primary provider', () {
      expect(
        EgyptianPhoneNumber.primaryProvider('01012345678'),
        WalletProvider.vodafoneCash,
      );
      expect(
        EgyptianPhoneNumber.primaryProvider('01112345678'),
        WalletProvider.etisalatCash,
      );
      expect(
        EgyptianPhoneNumber.primaryProvider('01212345678'),
        WalletProvider.orangeMoney,
      );
      expect(
        EgyptianPhoneNumber.primaryProvider('01512345678'),
        WalletProvider.wePay,
      );
    });
  });

  group('Result<T> Tests', () {
    test('Success returns data and folds correctly', () {
      const result = Success<int>(42);
      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.dataOrNull, 42);

      final folded = result.fold(
        (failure) => 'failed',
        (data) => 'success $data',
      );
      expect(folded, 'success 42');
    });

    test('FailureResult returns failure and folds correctly', () {
      const failure = ServerFailure(code: '500');
      const result = FailureResult<int>(failure);
      expect(result.isSuccess, isFalse);
      expect(result.isFailure, isTrue);
      expect(result.failureOrNull, failure);

      final folded = result.fold(
        (failure) => 'failed ${failure.code}',
        (data) => 'success',
      );
      expect(folded, 'failed 500');
    });
  });

  group('TextValidators Tests', () {
    test('validates email formats', () {
      expect(TextValidators.isValidEmail('user@example.com'), isTrue);
      expect(TextValidators.isValidEmail('user.name+tag@domain.co'), isTrue);
      expect(TextValidators.isValidEmail('invalid-email'), isFalse);
      expect(TextValidators.isValidEmail(''), isFalse);
      expect(TextValidators.isValidEmail(null), isFalse);
    });

    test('validates password minimum length', () {
      expect(TextValidators.isValidPassword('123456'), isTrue);
      expect(TextValidators.isValidPassword('12345'), isFalse);
      expect(TextValidators.isValidPassword(null), isFalse);
    });

    test('validates isNotEmpty', () {
      expect(TextValidators.isNotEmpty('valid'), isTrue);
      expect(TextValidators.isNotEmpty('   '), isFalse);
      expect(TextValidators.isNotEmpty(null), isFalse);
    });
  });
}
