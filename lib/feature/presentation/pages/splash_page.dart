import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_app/feature/presentation/blocs/splash/splash_bloc.dart';
import 'package:itunes_app/feature/presentation/widget/atoms/colors.dart';
import 'package:shimmer/shimmer.dart';

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
            body: Center(
              child: Shimmer.fromColors(
                baseColor: AtomColors.primaryColor,
                highlightColor: Colors.black12,
                child: Image.asset('assets/icons/ic-apple.png',
                    width: 80, height: 80),
              ),
            ),
          );
        },
      ),
    );
  }
}
