class AppUser {
  final String email;
  final String login;
  final String name;
  final String userId;

  AppUser({
    required this.email,
    required this.name,
    required this.login,
    required this.userId,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      email: json['email'] ?? '',
      login: json['login'] ?? '',
      name: json['name'] ?? '',
      userId: json['userId'] ?? '',
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'login': login,
    };
  }

  AppUser copyWith({
    String? name,
    String? phoneNumber,
    String? phoneNumberAlt,
    String? photoUrl,
  }) {
    return AppUser(
      userId: this.userId,
      email: this.email,
      name: name ?? this.name,
      login: this.login,
    );
  }
}
