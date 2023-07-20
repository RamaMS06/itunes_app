// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:itunes_app/app/router/routes.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(BuildContext context) : super(SplashInitial()) {
    on<GoToHomePage>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, Routes.homePage);
      });
    });
  }
}
