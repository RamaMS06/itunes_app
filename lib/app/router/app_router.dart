import 'package:flutter/material.dart';
import 'package:itunes_app/app/router/routes.dart';
import 'package:itunes_app/feature/presentation/pages/detail_music_page.dart';
import 'package:itunes_app/feature/presentation/pages/home_page.dart';
import 'package:itunes_app/feature/presentation/pages/splash_page.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> pages = {
    Routes.splash: (context) => const SplashPage(),
    Routes.homePage: (context) => const HomePage(),
    Routes.detailMusic: (context) => const DetailMusicPage()
  };
}
