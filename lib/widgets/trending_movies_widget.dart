import 'package:flutter/material.dart';
import 'package:my_movie_app/Providers/movie_provider.dart';
import 'package:my_movie_app/models/movie_class.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class TrendingMoviesWidget extends StatelessWidget {
  final String movieTypeName;
  final List<MovieClass> movieList;

  TrendingMoviesWidget({
    this.movieTypeName,
    this.movieList,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .02),
          child: Text(
            movieTypeName,
            style: kTypeNameStyle,
            textAlign: TextAlign.start,
          ),
        ),
        Container(
            alignment: Alignment.center,
            height: size.height * .2,
            child: Consumer<MoviesProvider>(
              builder: (context, movieProvider, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (context, index) => FutureBuilder(
                  future: movieProvider.getTrendingMovies(),
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            backgroundColor: kWidgetOnEmptyColor,
                            radius: 50,
                            backgroundImage: NetworkImage(
                                '$kTMDBImages${movieList[index].imageURL}'),
                          ),
                        ),
                        Container(
                          width: size.width * .2,
                          padding: EdgeInsets.only(top: size.height * .01),
                          child: movieList[index].title == null
                              ? Text(
                                  'Not Available',
                                  style: kTitleStyle,
                                  overflow: TextOverflow.fade,
                                )
                              : Text(
                                  '${movieList[index].title}',
                                  style: kTitleStyle,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
