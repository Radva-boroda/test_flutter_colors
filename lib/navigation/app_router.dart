
import 'package:auto_route/auto_route.dart';
import 'package:test_case/features/main_page/presentation/pages/main_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          path: '/main',
        ),
      ];
}
