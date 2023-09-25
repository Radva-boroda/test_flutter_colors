import 'package:dio/dio.dart';
import 'package:test_case/core/constants/web.dart';

class DioClient {
  static final client = Dio(
    BaseOptions(
      baseUrl: Web.apiRoot,
    ),
  );
}
