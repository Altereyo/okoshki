class SaloonBalance {
  final int id;
  final String amount;
  final String created;
  final String transactionType;
  final String? transactionCategory;

  SaloonBalance( {
    required this.id,
    required this.amount,
    required this.created,
    required this.transactionType,
    required this.transactionCategory,
  });

  @override
  String toString() => '$id $amount $created';
}

