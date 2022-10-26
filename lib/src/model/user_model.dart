class UserModel {
  String id;
  final String phone;
  final String name;
  final String password;
  final String description;
  final String image;
  final int gender;
  final DateTime createAt;
  final DateTime updateAt;

  UserModel({
    this.id = '',
    required this.phone,
    required this.name,
    required this.password,
    required this.createAt,
    required this.updateAt,
    this.description = "",
    this.image = "",
    this.gender = -1,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] ?? "",
        phone: json['phone'] ?? "",
        password: json['password'] ?? "",
        description: json['description'] ?? "",
        image: json['image'] ?? "",
        gender: json['gender'] ?? -1,
        createAt: json['create_at'] == null
            ? DateTime.now()
            : DateTime.parse(json['create_at']),
        updateAt: json['update_at'] == null
            ? DateTime.now()
            : DateTime.parse(json['update_at']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'password': password,
        'description': description,
        'gender': gender,
        'image': image,
        'create_at': createAt,
        'update_at': updateAt,
      };
}
