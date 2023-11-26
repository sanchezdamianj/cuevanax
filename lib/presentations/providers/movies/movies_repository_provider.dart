import 'package:cuevanax/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cuevanax/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repo es inmutable.
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
