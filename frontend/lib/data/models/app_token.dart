class AppToken {
  final String token;


  AppToken({
    required this.token,
  });

  factory AppToken.fromJson(Map<String, dynamic> json) {
    return AppToken(
      token: json['token'] ?? '',
    );
  }



}
