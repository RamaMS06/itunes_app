import 'package:dartz/dartz.dart';
import 'package:itunes_app/feature/data/models/search_model.dart';

abstract class SearchDataSource {
  Future<Either<SearchModel, String>> getSearch();
}
