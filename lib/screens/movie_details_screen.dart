import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/constants.dart';
import 'package:my_movie_app/models/movie_class.dart' show MovieClass;
import 'package:provider/provider.dart';
import '../Providers/movie_provider.dart';
import '../widgets/movie_detail_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  static const route = 'MovieDetailScreen';
  @override
  Widget build(BuildContext context) {
    final movieID = ModalRoute.of(context).settings.arguments;
    final List<MovieClass> movies =
        Provider.of<MoviesProvider>(context).getTrendMoviesList;
    var movieIndex = movies.indexWhere((element) => element.id == movieID);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kAccentColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            expandedHeight: size.height * .5,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '$kTMDBImages${movies[movieIndex].imageURL}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => MovieDetailWidget(
                    size: size, movies: movies, movieIndex: movieIndex),
                childCount: 1),
          ),
        ],
      ),
    );
  }
}
