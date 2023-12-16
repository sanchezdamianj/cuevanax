import 'package:cuevanax/domain/datasources/local_storage_datasource.dart';
import 'package:cuevanax/domain/entities/movie.dart';
import 'package:cuevanax/domain/repositories/local_storage_repository.dart';
import 'package:cuevanax/infrastructure/datasources/isar_datasource.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(IsarDatasource isarDatasource,
      {required this.datasource});

  @override
  Future<bool> isFavorite(int movieId) {
    return datasource.isFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadFavorites({int limit = 10, offset = 0}) {
    return datasource.loadFavorites(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}
