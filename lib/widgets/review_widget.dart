import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_movie_app/constants.dart';
import 'package:my_movie_app/models/movie_class.dart';
import 'package:http/http.dart' as http;

class ReviewsWidget extends StatefulWidget {
  final int movieID;
  ReviewsWidget(this.movieID);
  @override
  _ReviewsWidgetState createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  List<ReviewsClass> _movieReviewList = [];
  Future getMoviesReviews() async {
    final url = Uri.parse(
        '$kTMDBMainUrl/3/movie/${widget.movieID}/reviews?api_key=$kApiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedReviewData = jsonDecode(response.body);
      final movieReviewResult = decodedReviewData['results'];

      for (var reviews in movieReviewResult) {
        var movieReviews = ReviewsClass(
          author: reviews['author'],
          reviewContent: reviews['content'],
        );
        _movieReviewList.add(movieReviews);
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    getMoviesReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getMoviesReviews(),
      builder: (context, snapshot) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
            child: Text(
              'Reviews',
              style: TextStyle(fontSize: 20, color: kTextColor),
            ),
          ),
          Container(
            height: size.height * .6,
            child: ListView.builder(
                itemCount: _movieReviewList.length,
                itemBuilder: (context, index) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kAccentColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_movieReviewList[index].author}',
                            style: TextStyle(color: kTextColor, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${_movieReviewList[index].reviewContent}',
                            style: TextStyle(color: kTextColor),
                          ),
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
