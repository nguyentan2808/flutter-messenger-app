class UserModel {
  String id;
  String username;
  String name;
  String email;
  String phone;
  String avatar;
  String coverPhoto;
  String status;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.coverPhoto,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      coverPhoto: json['coverPhoto'],
      status: json['status'],
    );
  }
}
