import 'package:flutter/material.dart';
import 'package:my_movie_app/widgets/movie_column_tab%20widget.dart';
import 'package:provider/provider.dart';
import '../Providers/movie_provider.dart';

class MovieGenreWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .65,
      child: Consumer<MoviesProvider>(
        builder: (context, moviesProvider, child) => ListView(
          children: [
            MovieColumnTabWidget(
              typeNameText: '${moviesProvider.movieTypeNameList['trending']}',
              future: moviesProvider.getTrendingMovies(),
              itemCount: moviesProvider.getTrendMoviesList.length,
              movieClassList: moviesProvider.getTrendMoviesList,
            ),
            MovieColumnTabWidget(
              typeNameText: '${moviesProvider.movieTypeNameList['nowPlaying']}',
              future: moviesProvider.getNowPlayingMovies(),
              itemCount: moviesProvider.getNowMoviesList.length,
              movieClassList: moviesProvider.getNowMoviesList,
            ),
            MovieColumnTabWidget(
              typeNameText: '${moviesProvider.movieTypeNameList['topRated']}',
              future: moviesProvider.getTopRatedMovies(),
              itemCount: moviesProvider.getTopMoviesList.length,
              movieClassList: moviesProvider.getTopMoviesList,
            ),
          ],
        ),
      ),
    );
  }
}
