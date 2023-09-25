import 'package:flutter/material.dart';
import 'package:test_case/my_app.dart';
import 'package:test_case/navigation/app_router.dart';

void main() {
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}
