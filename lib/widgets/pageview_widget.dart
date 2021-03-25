import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:provider/provider.dart';
import '../Providers/movie_provider.dart';

class PageViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MoviesProvider>(context).getMoviesList;
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .26,
      child: PageView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kWidgetOnEmptyColor,
            ),
            child:
                // Image.network(
                //   '$kTMDBPoster${movies[index].poster}',
                //   fit: BoxFit.cover,
                // ),
                Text('hello'),
          ),
        ),
      ),
    );
  }
}
