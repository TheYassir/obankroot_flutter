class AccountModel {
  int id;
  String name;
  String iban;
  int balance;
  int userId;
  String createdAt;
  String updatedAt;

  AccountModel({
    required this.id,
    required this.name,
    required this.iban,
    required this.balance,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
      iban: json['iban'],
      balance: json['balance'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iban': iban,
        'balance': balance,
        'user_id': userId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
