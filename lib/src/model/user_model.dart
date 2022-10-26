class UserModel {
  String id;
  final String phone;
  final String name;
  final String password;
  final String description;
  final int gender;

  UserModel({
    this.id = '',
    required this.phone,
    required this.name,
    required this.password,
    this.description = "",
    this.gender = -1,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] ?? "",
        phone: json['phone'] ?? "",
        password: json['password'] ?? "",
        description: json['description'] ?? "",
        gender: json['gender'] ?? -1,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'password': password,
        'description': description,
        'gender': gender,
      };
}
