import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie_class.dart';
import 'package:my_movie_app/screens/movie_details_screen.dart';
import '../constants.dart';

class MovieColumnTabWidget extends StatelessWidget {
  final String typeNameText;
  final Future future;
  final int itemCount;
  final List<MovieClass> movieClassList;
  MovieColumnTabWidget({
    @required this.typeNameText,
    @required this.future,
    @required this.itemCount,
    @required this.movieClassList,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: size.width * 1,
          height: size.height * .05,
          child: Text(
            typeNameText,
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextColor, fontSize: 18),
          ),
        ),
        Container(
          height: size.height * .3,
          child: ListView.builder(
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => FutureBuilder(
              future: future,
              builder: (context, snapshot) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MovieDetailScreen.route,
                      arguments: {
                        'id': movieClassList[index].id,
                        'imageUrl': movieClassList[index].imageURL,
                        'rating': movieClassList[index].rating,
                        'description': movieClassList[index].description,
                        'poster': movieClassList[index].poster,
                        'title': movieClassList[index].title,
                      });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * .003),
                  width: snapshot.connectionState == ConnectionState.waiting
                      ? size.width * .44
                      : null,
                  decoration: BoxDecoration(color: kWidgetOnEmptyColor),
                  child: snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircleAvatar(
                              backgroundColor: Color(0x00ffffff),
                              radius: 12,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              )))
                      : Image.network(
                          '$kTMDBImages${movieClassList[index].imageURL}',
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
