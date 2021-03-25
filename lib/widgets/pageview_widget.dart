import 'package:flutter/material.dart';
import '../models/movie_class.dart' show MovieClass;
import '../constants.dart';
import 'package:provider/provider.dart';
import '../Providers/movie_provider.dart';

class PageViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MovieClass> movies =
        Provider.of<MoviesProvider>(context).getTrendMoviesList;
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .26,
      child: FutureBuilder(
        future: Provider.of<MoviesProvider>(context).getNowPlayingMovies(),
        builder: (context, snapshot) => PageView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kWidgetOnEmptyColor,
              ),
              child: Image.network(
                '$kTMDBPoster${movies[index].poster}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
