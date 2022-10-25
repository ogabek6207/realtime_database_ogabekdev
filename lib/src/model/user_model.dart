class UserModel {
  String id;
  final String phone;
  final String password;

  UserModel({
    this.id = '',
    required this.phone,
    required this.password,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? "",
        phone: json['phone'] ?? "",
        password: json['password'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'phone': phone,
        'password': password,
      };
}
