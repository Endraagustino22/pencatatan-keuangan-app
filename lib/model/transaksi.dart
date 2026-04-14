class TransactionModel {
  final String type; // "Masuk" / "Keluar"
  final String category;
  final double amount;
  final DateTime date;

  TransactionModel({
    required this.type,
    required this.category,
    required this.amount,
    required this.date,
  });
}