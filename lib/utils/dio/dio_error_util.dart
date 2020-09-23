import 'dart:collection';

import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static String handleError(error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Your request was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Your request has been timed out";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "System is unable to process your request now, please try again after checking internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Your request has been timed out";
          break;
        case DioErrorType.RESPONSE:
          if (error.response.statusCode == 401) {
            errorDescription = "Invalid ID or Password";
            break;
          }
          if (error.response.data?.isEmpty ?? true) {
            errorDescription =
                "System was unable to process request [${error.response.statusCode}]";
          } else {
            LinkedHashMap<String, dynamic> errRes = error.response.data;

            if (errRes["error"] == "invalid_grant") {
              errorDescription = "Invalid ID or Password";
            } else {
              errorDescription =
                  "System was unable to process request [${error.response.statusCode}]";
            }
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Your request has been timed out";
          break;
      }
    } else if (error is String) {
      errorDescription = error;
    } else {
      errorDescription =
          "System is unable to process your request now, please try again after checking internet connection";
    }
    return errorDescription;
  }
}
