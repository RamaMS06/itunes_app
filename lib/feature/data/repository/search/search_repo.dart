import 'package:dartz/dartz.dart';

import '../../models/search_model.dart';

abstract class SearchRepo {
  Future<Either<SearchModel, String>> getSearch();
}
