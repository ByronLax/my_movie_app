import 'package:flutter/material.dart';
import 'package:my_movie_app/Providers/movie_provider.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class TrendingMoviesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Text(
            'Trending',
            style: TextStyle(color: kTextColor, fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
            alignment: Alignment.center,
            height: size.height * .18,
            child: Consumer<MoviesProvider>(
              builder: (context, movieProvider, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieProvider.getTrendMoviesList.length,
                itemBuilder: (context, index) => FutureBuilder(
                  future: movieProvider.getTrendingMovies(),
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: kWidgetOnEmptyColor,
                          radius: 50,
                          backgroundImage: NetworkImage(
                              '$kTMDBImages${movieProvider.getTrendMoviesList[index].imageURL}'),
                        ),
                        Container(
                          width: size.width * .2,
                          padding: EdgeInsets.only(top: 10),
                          child:
                              movieProvider.getTrendMoviesList[index].title ==
                                      null
                                  ? Text(
                                      'Not Available',
                                      style: TextStyle(
                                          color: kTextColor, fontSize: 15),
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                    )
                                  : Text(
                                      '${movieProvider.getTrendMoviesList[index].title}',
                                      style: TextStyle(
                                          color: kTextColor, fontSize: 15),
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
