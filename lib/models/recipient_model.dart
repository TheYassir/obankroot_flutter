class RecipientModel {
  int id;
  String name;
  String iban;
  int accountId;
  int userId;
  String createdAt;
  String updatedAt;

  RecipientModel({
    required this.id,
    required this.name,
    required this.iban,
    required this.accountId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RecipientModel.fromJson(Map<String, dynamic> json) {
    return RecipientModel(
      id: json['id'],
      name: json['name'],
      iban: json['iban'],
      accountId: json['account_id'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iban': iban,
        'account_id': accountId,
        'user_id': userId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
