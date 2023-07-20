import 'package:get_it/get_it.dart';
import 'package:itunes_app/feature/data/datasource/search/search_data_source.dart';
import 'package:itunes_app/feature/data/datasource/search/search_data_source_impl.dart';

final locator = GetIt.instance;

setupGetIt() {
  locator.registerLazySingleton<SearchDataSource>(() => SearchDataSourceImpl());
}
