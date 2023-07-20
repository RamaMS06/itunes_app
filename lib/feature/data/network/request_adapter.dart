import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:itunes_app/app/core/utils/api_config.dart';

class RequestAdapter {
  Dio request = Dio(BaseOptions(
      followRedirects: true,
      responseType: ResponseType.json,
      baseUrl: ApiConfig.baseURL))
    ..interceptors.add(AwesomeDioInterceptor(
        logRequestTimeout: false,
        logRequestHeaders: false,
        logResponseHeaders: false));
}
