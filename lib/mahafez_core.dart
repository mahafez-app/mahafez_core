/// Layer 1: Core / Platform Pure Dart Foundation for the Mahafez Platform.
///
/// Exports pure foundation primitives:
/// - Functional [Result], [Success], [FailureResult]
/// - Domain [Failure] abstractions
/// - Clean [UseCase] contracts
/// - Enums ([WalletProvider], [TransactionType])
/// - Utilities ([EgyptianPhoneNumber], [TextValidators])
library;

export 'src/enums/transaction_type.dart';
export 'src/enums/wallet_provider.dart';
export 'src/error/failures.dart';
export 'src/error/result.dart';
export 'src/usecase/usecase.dart';
export 'src/utils/egyptian_phone_number.dart';
export 'src/utils/text_validators.dart';
