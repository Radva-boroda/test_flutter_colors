
import 'package:test_case/core/core.dart';
import 'package:test_case/features/main_page/domain/entities/quote_entity.dart';
import 'package:test_case/features/main_page/domain/repositories/main_page_repo.dart';


class MainPageUseCase extends MainPageRepo {

  final MainPageRepo dataSource;

  MainPageUseCase({
    required this.dataSource,
  });

  @override
  Future<List<QuoteEntity>> getQuote() async =>
      ((await dataSource.getQuote()) as List)
          .map((e) => QuoteEntity.fromJson(e as JType))
          .toList();
}
