class User {
  String id;
  final String name;
  final String password;

  User({
    this.id = '',
    required this.name,
    required this.password,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        password: json['password'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'password': password,
      };
}
