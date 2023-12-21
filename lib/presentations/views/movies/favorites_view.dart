import 'package:animate_do/animate_do.dart';
import 'package:cuevanax/config/helpers/human_format.dart';
import 'package:cuevanax/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

//initState() solo las primeras 10 movies

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: ListView.builder(
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              return _MovieItem(movie: favoriteMovies[index]);
            }));
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  // final Function onMovieSelected;
  const _MovieItem({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // onMovieSelected(movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(movie.posterPath,
                      loadingBuilder: (context, child, loadingProgress) =>
                          FadeIn(child: child))),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  (movie.overview.length > 100)
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),
                  Row(children: [
                    Icon(
                      Icons.star_half_rounded,
                      color: Colors.yellow.shade800,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(HumanFormat.number(movie.voteAverage, 1),
                        style: textStyles.bodySmall!.copyWith(
                          color: Colors.yellow.shade900,
                        )),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
