class User {
  final int id;
  final String username;
  final String password;
  final String avatar;
  final String role;

  const User(
      {required this.id,
      required this.username,
      required this.password,
      required this.avatar,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']??0,
      username: json['username']??'',
      password: json['password']??'',
      avatar: json['avatar']??'',
      role: json['role']??'',
    );
  }
}
