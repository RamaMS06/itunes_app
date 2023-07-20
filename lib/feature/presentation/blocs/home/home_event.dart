// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class DoSearchListMusic extends HomeEvent {
  String? query;

  DoSearchListMusic({this.query});
}

class GoToDetailMusicPage extends HomeEvent {
  int? id;

  GoToDetailMusicPage({this.id});
}
