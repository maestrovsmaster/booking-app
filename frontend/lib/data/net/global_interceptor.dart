import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String? _idToken;

  void updateToken(String idToken) {
    _idToken = idToken;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_idToken != null) {
      options.headers['Authorization'] = 'Bearer $_idToken';
    }
    super.onRequest(options, handler);
  }
}