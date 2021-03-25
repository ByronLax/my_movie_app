import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie_class.dart';

import '../constants.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({
    Key key,
    @required this.size,
    @required this.movies,
    @required this.movieIndex,
  }) : super(key: key);

  final Size size;
  final List<MovieClass> movies;
  final int movieIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${movies[movieIndex].title}',
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 25, color: kTextColor),
                ),
                IconButton(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: kTextColor,
                    ),
                    onPressed: () {})
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 10,
            ),
            child: Row(
              children: [
                Text(
                  '${movies[movieIndex].rating}',
                  style: TextStyle(fontSize: 20, color: kTextColor),
                ),
                Icon(
                  Icons.star,
                  color: kTextColor,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWidgetOnEmptyColor),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: TextStyle(color: kTextColor, fontSize: 20),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${movies[movieIndex].description}',
                  style: TextStyle(color: kTextColor, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
