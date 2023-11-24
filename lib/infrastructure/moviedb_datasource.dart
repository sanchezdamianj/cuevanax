import 'package:cuevanax/config/constants/enviroments.dart';
import 'package:cuevanax/domain/datasources/movies_datasource.dart';
import 'package:dio/dio.dart';

import '../domain/entities/movie.dart';

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
    // final List<Movie>> movies = [];

    return [];
  }
}
