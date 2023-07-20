import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_app/app/router/routes.dart';
import 'package:itunes_app/feature/presentation/blocs/splash/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(context)..add(GoToHomePage()),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.homePage);
              },
              child: const SafeArea(child: Text('TESTING')),
            ),
          );
        },
      ),
    );
  }
}
