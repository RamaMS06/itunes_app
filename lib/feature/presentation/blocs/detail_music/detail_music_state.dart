part of 'detail_music_bloc.dart';

abstract class DetailMusicState extends Equatable {
  final SearchResultModel? resultModel;
  final int? musicIndex;
  final bool? isPlayed;
  const DetailMusicState({required this.resultModel, required this.musicIndex, required this.isPlayed});

  @override
  List<Object> get props =>
      [resultModel ?? SearchResultModel(), musicIndex ?? 0, isPlayed ?? false];
}

class DetailMusicInitial extends DetailMusicState {
  DetailMusicInitial() : super(resultModel: SearchResultModel(), musicIndex: 0, isPlayed: false);
}

class DetailMusicLoaded extends DetailMusicState {
  const DetailMusicLoaded({SearchResultModel? resultModel, int? musicIndex, bool? isPlayed})
      : super(resultModel: resultModel, musicIndex: musicIndex, isPlayed: isPlayed);
}
