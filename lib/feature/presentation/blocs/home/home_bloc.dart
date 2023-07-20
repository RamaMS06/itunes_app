// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:itunes_app/app/core/di/locator.dart';
import 'package:itunes_app/feature/data/models/search_model.dart';
import 'package:itunes_app/feature/data/repository/search/search_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  TextEditingController searchController = TextEditingController();
  HomeBloc(BuildContext context) : super(HomeInitial()) {
    on<DoSearchListMusic>((event, emit) async {
      emit(SearchDataLoading());
      final fetch =
          await locator.get<SearchRepo>().getSearch(event.query ?? 'Creep');
      fetch.fold((data) {
        if (data.resultCount == 0 || data.results == []) {
          emit(SearchDataEmpty());
        } else {
          emit(SearchDataLoaded(data));
        }
      }, (r) {
        inspect(r);
      });
    });
  }
}
