import 'package:flutter/material.dart';
import 'package:itunes_app/app/router/app_router.dart';
import 'package:itunes_app/app/router/routes.dart';

import '../core/di/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      routes: AppRouter.pages,
    );
  }
}
