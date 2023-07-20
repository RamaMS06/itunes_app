import 'package:itunes_app/app/core/di/locator.dart';
import 'package:itunes_app/feature/data/datasource/search/search_data_source.dart';
import 'package:itunes_app/feature/data/models/search_model.dart';
import 'package:dartz/dartz.dart';
import 'package:itunes_app/feature/data/repository/search/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchDataSource _dataSource = locator.get<SearchDataSource>();
  @override
  Future<Either<SearchModel, String>> getSearch(String query) => _dataSource.getSearch(query);
}
