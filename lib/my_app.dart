import 'package:flutter/material.dart';
import 'package:test_case/navigation/app_router.dart';

/// Entry point for flutter application;
class MyApp extends StatelessWidget {
  /// base constructor
  const MyApp({
    required this.appRouter,
    super.key,
  });

  /// auto router
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
