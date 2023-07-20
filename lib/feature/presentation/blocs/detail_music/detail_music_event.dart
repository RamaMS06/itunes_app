part of 'detail_music_bloc.dart';

abstract class DetailMusicEvent extends Equatable {
  const DetailMusicEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailMusic extends DetailMusicEvent{}
