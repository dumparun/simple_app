import 'package:simple/constants/config.dart';
import 'package:simple/constants/local_data.dart';
import 'package:simple/data/network/dio_client.dart';
import 'package:simple/modules/preference_module.dart';
import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:validators/validators.dart';

@module
class NetworkModule extends PreferenceModule {
  // ignore: non_constant_identifier_names
  final String TAG = "NetworkModule";

  // DI Providers:--------------------------------------------------------------
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  Dio provideDio() {
    final dio = Dio();

    dio
      ..options.baseUrl = Config.baseUrl
      ..options.connectTimeout = Config.connectionTimeout
      ..options.receiveTimeout = Config.receiveTimeout
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (Options options) async {
            var token = LocalData().accessToken;

            if (!isNull(token)) {
              options.headers.putIfAbsent('access_token', () => token);
              options.headers
                  .putIfAbsent('refresh_token', () => LocalData().refreshToken);
              options.headers
                  .putIfAbsent('X-CSRF-Token', () => LocalData().csrfToken);
            }
          },
        ),
      );

    return dio;
  }

  /// A singleton dio_client provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  DioClient provideDioClient(Dio dio) => DioClient(provideDio());

  /// A singleton dio_client provider.
  ///
  /// Calling it multiple times will return the same instance.

}
