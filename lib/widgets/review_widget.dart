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
    List<ReviewsClass> movieReviewList = [];
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
        movieReviewList.add(movieReviews);
      }
      List<ReviewsClass> subList = movieReviewList.sublist(0, 5);
      setState(() {
        _movieReviewList = subList;
      });
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
      builder: (context, snapshot) => Container(
        margin: EdgeInsets.symmetric(vertical: size.height * .005),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: kAccentColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height * .01),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .02, vertical: size.height * .02),
              child: Text(
                'Reviews',
                style: TextStyle(fontSize: 20, color: kTextColor),
              ),
            ),
            Container(
              height: size.height * .4,
              child: ListView.builder(
                  itemCount: _movieReviewList.length,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * .02,
                            vertical: size.height * .01),
                        decoration: BoxDecoration(color: kAccentColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_movieReviewList[index].author}',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: size.height * .005,
                            ),
                            Text(
                              '${_movieReviewList[index].reviewContent}',
                              maxLines: 10,
                              overflow: TextOverflow.fade,
                              style: TextStyle(color: kTextColor),
                            ),
                          ],
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
