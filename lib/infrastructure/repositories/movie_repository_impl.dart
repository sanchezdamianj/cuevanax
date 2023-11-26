import 'package:cuevanax/domain/datasources/movies_datasource.dart';
import 'package:cuevanax/domain/entities/movie.dart';
import 'package:cuevanax/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MovieDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
