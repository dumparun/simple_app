class AuthData {
  String userId;
  String name;
  String accessToken;
  String refreshToken;
  String csrfToken;
  String userRole;
  String emailId;
  int expiresIn;
  String loginId;
  DateTime lastLoggedInTime;

  AuthData(
      {this.userId,
      this.name,
      this.accessToken,
      this.refreshToken,
      this.emailId,
      this.csrfToken,
      this.loginId,
      this.expiresIn,
      this.lastLoggedInTime,
      this.userRole});

  factory AuthData.fromMap(Map<String, dynamic> json) => AuthData(
      userId: json["userId"],
      name: json["name"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      emailId: json["emailId"],
      csrfToken: json['csrfToken'],
      expiresIn: json['expiresIn'],
      loginId: json['loginId'],
      lastLoggedInTime: DateTime.parse(json['lastLoggedInTime']),
      userRole: json['userRole']);

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "name": name,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "loginId": loginId,
        "emailId": emailId,
        "userRole": userRole,
        "lastLoggedInTime": lastLoggedInTime.toIso8601String(),
        "csrfToken": csrfToken,
        "expiresIn": expiresIn,
      };
}
