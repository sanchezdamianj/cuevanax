import '../entities/movie.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Movie movie);

  Future<bool> isFavorite(int movieId);

  Future<List<Movie>> loadFavorites({int limit = 10, offset = 0});
}
