class UserModel {
  String id;
  final String phoneNumber;
  final String password;

  UserModel({
    this.id = '',
    required this.phoneNumber,
    required this.password,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? "",
        phoneNumber: json['name'] ?? "",
        password: json['password'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': phoneNumber,
        'password': password,
      };
}
