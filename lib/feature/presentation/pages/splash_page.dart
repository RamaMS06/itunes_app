import 'package:flutter/material.dart';
import 'package:itunes_app/app/router/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.homePage);
        },
        child: const SafeArea(child: Text('TESTING')),
      ),
    );
  }
}
