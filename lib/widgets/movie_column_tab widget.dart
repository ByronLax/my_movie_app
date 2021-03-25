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
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .001),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .02, vertical: size.height * .02),
            alignment: Alignment.centerLeft,
            width: size.width * 1,
            child: Text(typeNameText,
                textAlign: TextAlign.center, style: kTypeNameStyle),
          ),
          Container(
            height: size.height * .35,
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
                    print(movieClassList[index].id);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          color: kWidgetOnEmptyColor,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * .005),
                          child: Image.network(
                              '$kTMDBImages${movieClassList[index].imageURL}',
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        width: size.width * .3,
                        padding: EdgeInsets.only(top: size.height * .01),
                        child: movieClassList[index].title == null
                            ? Text(
                                'Not Available',
                                style: kTitleStyle,
                                overflow: TextOverflow.fade,
                              )
                            : Text(
                                '${movieClassList[index].title}',
                                style: kTitleStyle,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
