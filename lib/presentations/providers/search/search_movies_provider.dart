import 'package:cuevanax/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../movies/movies_repository_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>(
  (ref) {
    final movieRepository = ref.watch(movieRepositoryProvider);
    return SearchedMoviesNotifier(
      ref: ref,
      searchMovies: movieRepository.searchMovies,
    );
  },
);

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({required this.ref, required this.searchMovies})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return state;
  }
}
