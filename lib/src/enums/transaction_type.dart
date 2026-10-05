/// Core transaction type enum for monetary ledger entries.
enum TransactionType {
  receive,
  send;

  factory TransactionType.fromString(String str) {
    return switch (str.toLowerCase().trim()) {
      'send' => .send,
      'receive' => .receive,
      _ => throw ArgumentError('Invalid transaction type string: $str'),
    };
  }
}
