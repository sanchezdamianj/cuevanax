import 'package:cuevanax/infrastructure/models/moviedb/moviedb_videos.dart';

import '../../domain/entities/video.dart';

class VideoMapper {
  static moviedbVideoToEntity(Result moviedbVideo) => Video(
        id: moviedbVideo.id,
        name: moviedbVideo.name,
        youtubeKey: moviedbVideo.key,
        publishedAt: moviedbVideo.publishedAt,
      );
}
