import 'package:cuevanax/domain/entities/actor.dart';
import 'package:cuevanax/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor casToEntity(Cast cas) => Actor(
        id: cas.id,
        name: cas.name,
        profilePath: cas.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cas.profilePath}'
            : 'https://i.stack.imgur.com/GNhxO.png',
        character: cas.character,
      );
}
