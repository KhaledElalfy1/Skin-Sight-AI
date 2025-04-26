import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio();

      _dio!.interceptors
        ..add(_dioInterceptors())
        ..add(_dioInterceptorWrapper());

      return _dio!;
    }
    return _dio!;
  }

  static InterceptorsWrapper _dioInterceptorWrapper() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token =
            ''; //await SecureStorage.instance.getData(key: ApiKeys.token);
      
        options.headers.addAll({
          'Authorization': token == null ? null : "Bearer $token",

        });
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    );
  }

  static Interceptor _dioInterceptors() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      request: true,
    );
  }
}
