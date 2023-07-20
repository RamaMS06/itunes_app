import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'detail_music_event.dart';
part 'detail_music_state.dart';

class DetailMusicArgs {
  int artisId;
  DetailMusicArgs({required this.artisId});
}

class DetailMusicBloc extends Bloc<DetailMusicEvent, DetailMusicState> {
  DetailMusicBloc(BuildContext context, DetailMusicArgs args)
      : super(const DetailMusicInitial()) {
    on<FetchDetailMusic>((event, emit) {
      emit(DetailMusicLoaded(args.artisId));
    });
  }
}
