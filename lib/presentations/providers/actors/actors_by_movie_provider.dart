import 'package:cuevanax/domain/entities/actor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(actorRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier(this.getActors) : super({});

  Future<void> loadActors(String movieId) async {
    // if it was loaded before, don't do anything
    if (state[movieId] != null) return;

    //if was not loaded before, just call the api
    final actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
