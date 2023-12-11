import 'package:animate_do/animate_do.dart';
import 'package:cuevanax/config/helpers/human_format.dart';
import 'package:cuevanax/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  State<MovieHorizontalListView> createState() =>
      _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    if (widget.loadNextPage == null) return;

    if (widget.loadNextPage != null) {
      scrollController.addListener(() {
        if ((scrollController.position.pixels + 200) >=
            scrollController.position.maxScrollExtent) {
          widget.loadNextPage!();
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(children: [
        if (widget.title != null || widget.subtitle != null)
          _Title(title: widget.title, subtitle: widget.subtitle),
        Expanded(
          child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                return FadeInRight(
                  child: _Slide(
                    movie: widget.movies[index],
                  ),
                );
              }),
        )
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //IMAGE
        SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                      onTap: () => context.push('/home/0/movie/${movie.id}'),
                      child: FadeIn(child: child));
                },
              ),
            )),

        const SizedBox(height: 5),

        //title
        SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyle.titleSmall,
            )),

        //rating
        SizedBox(
          width: 150,
          child: Row(children: [
            Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
            const SizedBox(
              width: 3,
            ),
            Text('${movie.voteAverage}',
                style: textStyle.bodySmall
                    ?.copyWith(color: Colors.yellow.shade800)),
            const Spacer(),
            Text(HumanFormat.number(movie.popularity),
                style: textStyle.bodySmall),
          ]),
        )
      ]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (title != null)
          Text(title!, style: Theme.of(context).textTheme.titleLarge),
        const Spacer(),
        if (subtitle != null)
          FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!))
      ]),
    );
  }
}
