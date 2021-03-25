import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/constants.dart';

import '../widgets/movie_detail_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  static const route = 'MovieDetailScreen';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Map<String, Object> movieClass = ModalRoute.of(context).settings.arguments;
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
                '$kTMDBImages${movieClass['imageUrl']}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => MovieDetailWidget(
                      imageUrl: movieClass['imageUrl'],
                      title: movieClass['title'],
                      id: movieClass['id'],
                      description: movieClass['description'],
                      rating: movieClass['rating'],
                      poster: movieClass['poster'],
                    ),
                childCount: 1),
          ),
        ],
      ),
    );
  }
}
