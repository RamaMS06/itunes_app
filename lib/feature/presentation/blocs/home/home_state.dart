// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  SearchModel searchModel;
  HomeState({required this.searchModel});

  @override
  List<Object> get props => [searchModel];
}

class HomeInitial extends HomeState {
  HomeInitial() : super(searchModel: SearchModel());
}

class SearchDataLoading extends HomeState {
  SearchDataLoading() : super(searchModel: SearchModel());
}

class SearchDataLoaded extends HomeState {
  SearchDataLoaded(SearchModel searchModel) : super(searchModel: searchModel);
}

class SearchDataEmpty extends HomeState {
  SearchDataEmpty() : super(searchModel: SearchModel());
}
