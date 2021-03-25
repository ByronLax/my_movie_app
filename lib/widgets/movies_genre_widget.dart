import 'package:flutter/material.dart';
import 'package:my_movie_app/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../Providers/movie_provider.dart';

class MovieGenreWidgets extends StatefulWidget {
  @override
  _MovieGenreWidgetsState createState() => _MovieGenreWidgetsState();
}

class _MovieGenreWidgetsState extends State<MovieGenreWidgets> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .65,
      child: Consumer<MoviesProvider>(
        builder: (context, moviesTypes, child) => ListView.builder(
          itemCount: moviesTypes.movieMapList.length,
          itemBuilder: (context, index) => FutureBuilder(
            future: Provider.of<MoviesProvider>(context).getTrendingMoviesTMDB(
              Provider.of<MoviesProvider>(context).moviesMiddleUrl(index),
            ),
            builder: (context, snapshot) => Container(
              height: size.height * .35,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: size.width * 1,
                    height: size.height * .05,
                    child: Text(
                      '${moviesTypes.movieMapList[index]['movieType']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kTextColor, fontSize: 18),
                    ),
                  ),
                  Container(
                    height: size.height * .3,
                    child: Consumer<MoviesProvider>(
                      builder: (context, moviesList, child) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: moviesList.getMoviesList.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MovieDetailScreen.route,
                              arguments: moviesList.getMoviesList[index].id,
                            );
                          },
                          child: Container(
                            child: Image.network(
                              '$kTMDBImages${moviesList.getMoviesList[index].imageURL}',
                              fit: BoxFit.cover,
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * .005,
                                vertical: size.height * .005),
                            color: kWidgetOnEmptyColor,
                            width: size.width * .4,
                            height: size.height * .3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
