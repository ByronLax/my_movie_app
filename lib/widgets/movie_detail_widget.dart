import 'package:flutter/material.dart';
import 'package:my_movie_app/widgets/movie_cast_widget.dart';
import 'package:my_movie_app/widgets/review_widget.dart';
import '../constants.dart';

class MovieDetailWidget extends StatelessWidget {
  final int movieID;
  final String description;
  final double rating;
  final String imageUrl;
  final String poster;
  final String title;
  MovieDetailWidget({
    this.movieID,
    this.poster,
    this.imageUrl,
    this.description,
    this.rating,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  title == null ? 'Not Available' : title,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 20, color: kTextColor),
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
                  '$rating',
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
            decoration: BoxDecoration(color: kWidgetOnEmptyColor),
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
                  '$description',
                  style: TextStyle(color: kTextColor, fontSize: 16),
                ),
              ],
            ),
          ),
          MovieCastWidget(
            movieID: movieID,
          ),
          ReviewsWidget(movieID),
        ],
      ),
    );
  }
}
