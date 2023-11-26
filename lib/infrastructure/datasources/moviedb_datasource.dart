import 'package:cuevanax/infrastructure/mappers/movie_mapper.dart';
import 'package:cuevanax/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';
import 'package:cuevanax/config/constants/enviroments.dart';
import 'package:cuevanax/domain/datasources/movies_datasource.dart';

import '../../domain/entities/movie.dart';

class MoviedbDatasource extends MovieDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environments.theMovieDbKey,
      'language': 'en-US',
    },
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();

    return movies;
  }
}
