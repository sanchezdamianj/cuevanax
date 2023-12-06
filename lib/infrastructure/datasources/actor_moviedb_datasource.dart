import 'package:cuevanax/config/constants/enviroments.dart';
import 'package:cuevanax/domain/datasources/actors_datasource.dart';
import 'package:cuevanax/domain/entities/actor.dart';
import 'package:cuevanax/infrastructure/mappers/actor_mapper.dart';
import 'package:cuevanax/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environments.theMovieDbKey,
      'language': 'en-US',
    },
  ));

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors =
        castResponse.cast.map((cast) => ActorMapper.casToEntity(cast)).toList();
    return actors;
  }
}
