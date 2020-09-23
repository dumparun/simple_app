class LoginResponse {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String userRole;
  String userType;
  String userId;
  String csrfToken;

  LoginResponse(
      {this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.expiresIn,
      this.userRole,
      this.userType,
      this.userId,
      this.csrfToken});

  factory LoginResponse.fromJson(Map<String, dynamic> parsedJson) {
    return LoginResponse(
        accessToken: parsedJson['access_token'],
        csrfToken: parsedJson['csrf_token'],
        tokenType: parsedJson['token_type'],
        refreshToken: parsedJson['refresh_token'],
        expiresIn: parsedJson['expires_in'],
        userId: parsedJson['user_id']);
  }
}
