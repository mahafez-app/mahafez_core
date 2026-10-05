import 'package:mahafez_core/mahafez_core.dart';

void main() {
  // 1. Functional Result usage:
  const Result<String> result = Success('Operation completed');
  result.fold(
    (failure) => print('Error: ${failure.technicalMessage}'),
    (data) => print('Success: $data'),
  );

  // 2. Egyptian Phone Normalization:
  final normalized = EgyptianPhoneNumber.normalize('+201030096242');
  final provider = EgyptianPhoneNumber.primaryProvider(normalized);
  print('Normalized: $normalized, Provider: ${provider?.name}');

  // 3. Text Validation:
  final isEmailValid = TextValidators.isValidEmail('developer@mahafez.app');
  print('Email valid: $isEmailValid');
}
