// ignore_for_file: must_be_immutable

part of 'detail_music_bloc.dart';

abstract class DetailMusicEvent extends Equatable {
  const DetailMusicEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailMusic extends DetailMusicEvent {}

class TurnPlayMusic extends DetailMusicEvent {
  bool isPlayed;
  TurnPlayMusic(this.isPlayed);
}

class PlayMusic extends DetailMusicEvent {
  double musicIndex;
  bool isPlayed;
  PlayMusic(this.musicIndex, this.isPlayed);
}

class PauseMusic extends DetailMusicEvent {}

class SliderIndexMusic extends DetailMusicEvent {
  double musicIndex;
  SliderIndexMusic(this.musicIndex);
}

class ProgressIndexMusic extends DetailMusicEvent {
  double musicIndex;
  ProgressIndexMusic(this.musicIndex);
}

class DisposeMusic extends DetailMusicEvent {}
