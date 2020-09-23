class Config {
  Config._();

// base url
  static const String baseUrl = "";

// // base url
  // static const String baseUrl = "";

  // api context
  static const String apiContext = "/api/v1";
  // receiveTimeout
  static const int receiveTimeout = 45000;
  // connectTimeout
  static const int connectionTimeout = 40000;
  // booking endpoints
  static const String login = baseUrl + apiContext + "oauth/token";

  static const String baseUrlV1 = baseUrl + apiContext;

  static const int splashScreenTimeout = 3000;

  static const int errorMessageTimeOut = 4;

  static const int successMessageTimeOut = 3;
}
