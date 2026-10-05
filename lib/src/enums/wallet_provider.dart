/// Pure domain representation of Egyptian digital wallet providers.
/// ZERO Flutter UI or presentation dependencies.
enum WalletProvider {
  vodafoneCash,
  orangeMoney,
  etisalatCash,
  instaPay,
  wePay,
  unknown;

  static WalletProvider fromString(String value) {
    switch (value.toLowerCase().replaceAll(' ', '_')) {
      case 'vodafone_cash':
      case 'vodafone':
        return .vodafoneCash;
      case 'orange_money':
      case 'orange':
        return .orangeMoney;
      case 'etisalat_cash':
      case 'etisalat':
        return .etisalatCash;
      case 'instapay':
        return .instaPay;
      case 'we_pay':
      case 'we':
        return .wePay;
      default:
        return .unknown;
    }
  }

  String get toValue => switch (this) {
    .vodafoneCash => 'vodafone_cash',
    .orangeMoney => 'orange_money',
    .etisalatCash => 'etisalat_cash',
    .instaPay => 'instapay',
    .wePay => 'we_pay',
    .unknown => 'unknown',
  };
}
