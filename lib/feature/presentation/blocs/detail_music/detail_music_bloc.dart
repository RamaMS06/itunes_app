import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:itunes_app/feature/data/models/search_model.dart';
import 'package:just_audio/just_audio.dart';

part 'detail_music_event.dart';
part 'detail_music_state.dart';

class DetailMusicArgs {
  SearchResultModel resultModel;
  DetailMusicArgs({required this.resultModel});
}

class DetailMusicBloc extends Bloc<DetailMusicEvent, DetailMusicState> {
  final AudioPlayer _player = AudioPlayer();
  final double maxLengthMusic = 29;

  DetailMusicBloc(BuildContext context, DetailMusicArgs args)
      : super(DetailMusicInitial()) {
    on<FetchDetailMusic>((event, emit) async {
      emit(DetailMusicLoaded(resultModel: args.resultModel));
      await _player.setUrl(state.resultModel?.previewUrl ?? '');
    });

    on<TurnPlayMusic>((event, emit) {
      final isPlayed = event.isPlayed = !event.isPlayed;
      isPlayed
          ? add(PlayMusic(state.musicIndex ?? 0, isPlayed))
          : add(PauseMusic());

      emit(DetailMusicLoaded(
          resultModel: state.resultModel,
          isPlayed: isPlayed,
          musicIndex: state.musicIndex));
    });

    on<PlayMusic>((event, emit) async {
      _player.play();
      _player.positionStream.listen((event) {
        add(ProgressIndexMusic(event.inSeconds));
      });
      emit(DetailMusicLoaded(
          resultModel: state.resultModel,
          musicIndex: event.musicIndex,
          isPlayed: true));
    });

    on<SliderIndexMusic>((event, emit) async {
      await _player.seek(Duration(seconds: (event.musicIndex).round()));
      add(PauseMusic());
      await Future.delayed(const Duration(milliseconds: 2000));
      add(PlayMusic(event.musicIndex, false));
      emit(DetailMusicLoaded(
          resultModel: state.resultModel,
          musicIndex: event.musicIndex,
          isPlayed: state.isPlayed));
    });

    on<ProgressIndexMusic>((event, emit) {
      emit(DetailMusicLoaded(
          resultModel: state.resultModel,
          musicIndex: event.musicIndex ,
          isPlayed: state.isPlayed));
    });

    on<PauseMusic>((event, emit) {
      _player.pause();
      emit(DetailMusicLoaded(
          resultModel: state.resultModel,
          musicIndex: state.musicIndex,
          isPlayed: false));
    });

    on<DoPreviouseMusic>((event, emit) async {
      if ((state.musicIndex ?? 0) >= 2) {
        add(PauseMusic());
        final previouss = (state.musicIndex ?? 0) - 2;
        await _player.seek(Duration(seconds: previouss.round()));
        await Future.delayed(const Duration(milliseconds: 500));
        add(PlayMusic(previouss, state.isPlayed ?? false));
        emit(DetailMusicLoaded(
            resultModel: state.resultModel,
            musicIndex: previouss,
            isPlayed: state.isPlayed ?? false));
      }
    });

    on<DoForwardMusic>((event, emit) async {
      if ((state.musicIndex ?? 0) < maxLengthMusic) {
        add(PauseMusic());
        final forward = (state.musicIndex ?? 0) + 2;
        await _player.seek(Duration(seconds: forward.round()));
        await Future.delayed(const Duration(milliseconds: 500));
        add(PlayMusic(forward, state.isPlayed ?? false));
        emit(DetailMusicLoaded(
            resultModel: state.resultModel,
            musicIndex: forward,
            isPlayed: state.isPlayed ?? false));
      }
    });

    on<DisposeMusic>((event, emit) {
      _player.stop();
      _player.dispose();
    });
  }
}
