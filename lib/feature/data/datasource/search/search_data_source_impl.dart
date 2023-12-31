import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:itunes_app/app/core/utils/api_config.dart';
import 'package:itunes_app/feature/data/datasource/search/search_data_source.dart';
import 'package:itunes_app/feature/data/models/search_model.dart';
import 'package:itunes_app/feature/data/network/request_adapter.dart';

class SearchDataSourceImpl extends RequestAdapter implements SearchDataSource {
  @override
  Future<Either<SearchModel, String>> getSearch(String query) async {
    try {
      final requestParam = {'term': query};
      final response =
          await request.get(ApiConfig.search, queryParameters: requestParam);
      return left(SearchModel.fromJson(jsonDecode(response.data)));
    } on DioException catch (e) {
      return right(e.error.toString());
    }
  }
}
