import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:test_case/core/constants/web.dart';
import 'package:test_case/features/main_page/domain/repositories/main_page_repo.dart';


class MainPageRemoteDataSource extends MainPageRepo {
  final Dio dio;
  MainPageRemoteDataSource({
    required this.dio,
  });

  @override
  Future<List<dynamic>?> getQuote({
    String path = '/quotes/random',
  }) async {
    try {
      final response = await dio.get<List<dynamic>>(
        '${Web.apiRoot}$path',
      );

      return response.data;
    } catch (e, st) {
      log(
        'dio error',
        stackTrace: st,
        error: e,
      );
    }
  }
}
