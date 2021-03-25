import 'package:flutter/material.dart';
import 'package:my_movie_app/constants.dart';
import 'package:my_movie_app/models/movie_class.dart';
import 'package:my_movie_app/networking/networking.dart';
import 'package:my_movie_app/widgets/movie_column_tab%20widget.dart';
import 'package:my_movie_app/widgets/trending_movies_widget.dart';
import 'package:provider/provider.dart';
import '../Providers/movie_provider.dart';

class MovieGenreWidgets extends StatefulWidget {
  @override
  _MovieGenreWidgetsState createState() => _MovieGenreWidgetsState();
}

class _MovieGenreWidgetsState extends State<MovieGenreWidgets> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Container(
      child: Column(
        children: [
          TrendingMoviesWidget(
            movieList: moviesProvider.getTrendMoviesList,
            movieTypeName: 'Trending',
          ),
          MovieColumnTabWidget(
            typeNameText: 'Top Rated',
            future: moviesProvider.getTopRatedMovies(),
            itemCount: moviesProvider.getTopMoviesList.length,
            movieClassList: moviesProvider.getTopMoviesList,
          ),
          MovieColumnTabWidget(
            typeNameText: 'Popular',
            future: moviesProvider.getPopularMovies(),
            itemCount: moviesProvider.getPopularMoviesList.length,
            movieClassList: moviesProvider.getPopularMoviesList,
          ),
          MovieColumnTabWidget(
            typeNameText: 'Now Playing',
            future: moviesProvider.getNowPLayingMovies(),
            itemCount: moviesProvider.getNowPayingMoviesList.length,
            movieClassList: moviesProvider.getNowPayingMoviesList,
          ),
          MovieColumnTabWidget(
            typeNameText: 'Upcoming',
            future: moviesProvider.getUpComingMovies(),
            itemCount: moviesProvider.getUpComingList.length,
            movieClassList: moviesProvider.getUpComingList,
          ),
        ],
      ),
    );
  }
}
