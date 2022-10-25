class UserModel {
  String id;
  final String phone;
  final String name;
  final String password;

  UserModel({
    this.id = '',
    required this.phone,
    required this.name,
    required this.password,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        phone: json['phone'] ?? "",
        password: json['password'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'password': password,
      };
}
