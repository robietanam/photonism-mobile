class User {
  final String username;
  final String id;
  final String email;
  final String namaLengkap;
  final String profileImage;
  final String? password;
  final String? jwt;
  final DateTime createdAt;
  final DateTime updateAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.namaLengkap,
    required this.profileImage,
    this.password,
    this.jwt,
    required this.createdAt,
    required this.updateAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : username = json['user']['username'],
        email = json['user']['email'],
        id = json['user']['_id'],
        namaLengkap = json['user']['namaLengkap'],
        profileImage = json['user']['profileImage'],
        password = json['user']['password'],
        createdAt = DateTime.parse(json['user']['createdAt']),
        updateAt = DateTime.parse(json['user']['updatedAt']),
        jwt = json['token'];

  Map<String, dynamic> toJson() => {
        'name': username,
        'id': id,
        'email': email,
        'namaLengkap': namaLengkap,
        'profileImage': profileImage,
        'password': password,
        'createdAt': createdAt,
        'updateAt': updateAt,
        'jwt': jwt,
      };

  static List<String> toList(User user) => [
        user.username,
        user.id,
        user.email,
        user.namaLengkap,
        user.profileImage,
        user.createdAt.toString(),
        user.updateAt.toString(),
        user.jwt!,
      ];

  static User fromList(List<String> user) {
    return User(
      username: user[0],
      id: user[1],
      email: user[2],
      namaLengkap: user[3],
      profileImage: user[4],
      createdAt: DateTime.parse(user[5]),
      updateAt: DateTime.parse(user[6]),
      jwt: user[7],
    );
  }
}
