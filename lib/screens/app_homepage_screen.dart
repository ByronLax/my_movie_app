import 'package:flutter/material.dart';
import 'package:my_movie_app/screens/test_screen.dart';
import 'package:my_movie_app/widgets/movies_genre_widget.dart';
import 'package:my_movie_app/widgets/pageview_widget.dart';
import '../constants.dart';

class AppHomePageScreen extends StatelessWidget {
  static const route = 'AppHomePageScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentColor,
        title: Text('Movie'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestScreen()));
              })
        ],
      ),
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageViewWidget(),
            MovieGenreWidgets(),
          ],
        ),
      ),
    );
  }
}
