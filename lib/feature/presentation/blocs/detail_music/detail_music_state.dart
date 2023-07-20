part of 'detail_music_bloc.dart';

abstract class DetailMusicState extends Equatable {
  final int? artistId;
  const DetailMusicState({required this.artistId});

  @override
  List<Object> get props => [];
}

class DetailMusicInitial extends DetailMusicState {
  const DetailMusicInitial() : super(artistId: 0);
}

class DetailMusicLoaded extends DetailMusicState {
  const DetailMusicLoaded(int? artistId) : super(artistId: artistId);
}
