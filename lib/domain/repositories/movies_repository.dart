import 'package:cuevanax/domain/entities/movie.dart';
import 'package:cuevanax/domain/entities/video.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpComing({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getMovieById(String movieId);
  Future<List<Movie>> searchMovies(String query);
  Future<List<Movie>> getSimilarMovies(int movieId);
  Future<List<Video>> getYoutubeVideosById(int movieId);
}
