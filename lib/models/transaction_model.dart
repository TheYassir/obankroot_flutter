class TransactionModel {
  int id;
  String name;
  String amount;
  String date;
  int from_account_id;
  int to_account_id;

  TransactionModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.from_account_id,
    required this.to_account_id,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      name: json['name'],
      amount: json['amount'],
      date: json['date'],
      from_account_id: json['from_account_id'],
      to_account_id: json['to_account_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'amount': amount,
        'date': date,
        'from_account_id': from_account_id,
        'to_account_id': to_account_id,
      };
}
