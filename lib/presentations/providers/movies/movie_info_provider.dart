import 'package:cuevanax/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(movieRepository.getMovieById);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier(this.getMovie) : super({});

  Future<void> loadMovie(String movieId) async {
    // if it was loaded before, don't do anything
    if (state[movieId] != null) return;
    print('http request sent for $movieId');
    //if was not loaded before, just call the api
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
