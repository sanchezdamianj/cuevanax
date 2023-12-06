import 'package:cuevanax/domain/datasources/actors_datasource.dart';
import 'package:cuevanax/domain/entities/actor.dart';
import 'package:cuevanax/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorsRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    return datasource.getActorsByMovieId(movieId);
  }
}
