import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/movie_class.dart';

class MovieCastWidget extends StatefulWidget {
  final int movieID;
  MovieCastWidget({this.movieID});

  @override
  _MovieCastWidgetState createState() => _MovieCastWidgetState();
}

class _MovieCastWidgetState extends State<MovieCastWidget> {
  List<MovieCasts> _movieCastList = [];
  Future getMoviesCasts() async {
    List<MovieCasts> movieCastList = [];
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/${widget.movieID}/credits?api_key=134d65df73b3a736a094e603c5bb4825&language=en-US');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedCastData = jsonDecode(response.body);
      final movieCastResult = decodedCastData['cast'];

      for (var cast in movieCastResult) {
        var movieCasts = MovieCasts(
            name: cast['name'],
            profileImageUrl: cast['profile_path'],
            characterName: cast['character']);
        movieCastList.add(movieCasts);
      }
      List<MovieCasts> sublist = movieCastList.sublist(0, 10);
      setState(() {
        _movieCastList = sublist;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    getMoviesCasts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Casts',
            style: TextStyle(color: kTextColor, fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: kAccentColor),
          width: size.width * 1,
          height: size.height * .2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _movieCastList.length,
            itemBuilder: (context, index) => FutureBuilder(
              future: getMoviesCasts(),
              builder: (context, snapshot) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: kWidgetOnEmptyColor,
                      radius: 50,
                      backgroundImage: NetworkImage(
                          '$kTMDBImages${_movieCastList[index].profileImageUrl}'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        '${_movieCastList[index].name}',
                        style: TextStyle(color: kTextColor, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
