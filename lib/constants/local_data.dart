
class LocalData {
  static LocalData _instance;
  factory LocalData() => _instance ??= new LocalData._();
  LocalData._();

  String accessToken = '';

  String csrfToken = '';

  String refreshToken = '';

  String studentName = '';

  String loginId = '';

  String userId = "";

  cleanUp() {
    this.accessToken = '';
    this.csrfToken = '';
    this.refreshToken = '';
    this.studentName = '';
    this.loginId = '';
    this.userId = '';
  }
}
