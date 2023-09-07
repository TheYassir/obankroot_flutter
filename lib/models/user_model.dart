class UserModel {
  int id;
  String name;
  String email;
  String? email_verified_at;
  String? created_at;
  String? updated_at;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.email_verified_at,
      this.created_at,
      this.updated_at});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      email_verified_at: json['email_verified_at'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'email_verified_at': email_verified_at,
        'created_at': created_at,
        'updated_at': updated_at,
      };
}
