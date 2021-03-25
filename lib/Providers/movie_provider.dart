import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/movie_class.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class MoviesProvider extends ChangeNotifier {
  // List<MovieClass> _moviesTrendingList = [];
  // List<MovieClass> _moviesNowPlayingList = [];
  // List<MovieClass> _moviesTopRatedList = [];

  List<MovieClass> _moviesList = [];

  List<MovieClass> get getMoviesList {
    return [..._moviesList];
  }

  List<Map<String, String>> movieMapList = [
    {
      'movieType': 'Trending',
    },
    {
      'movieType': 'Now Playing',
    },
    {
      'movieType': 'Top Rated',
    },
  ];

  Future getTrendingMoviesTMDB(String middleUrl) async {
    final url = Uri.parse('$kTMDBMainUrl$middleUrl$kApiKey');
    final response = await http.get(url);
    final decodedMoviesData = jsonDecode(response.body);
    final resultMovies = decodedMoviesData['results'];

    for (var movies in resultMovies) {
      var movieClass = MovieClass(
          id: movies['id'],
          title: movies['title'],
          imageURL: movies['poster_path'],
          description: movies['overview'],
          rating: movies['vote_average'],
          poster: movies['backdrop_path']);

      _moviesList.add(movieClass);
    }
    notifyListeners();
  }

  String moviesMiddleUrl(int index) {
    if (movieMapList[index]['movieType'] == 'Trending') {
      return '/3/trending/all/day?api_key=';
    } else if (movieMapList[index]['movieType'] == 'Now Playing') {
      return '/3/movie/now_playing?api_key=';
    } else if (movieMapList[index]['movieType'] == 'Top Rated') {
      return '/3/movie/top_rated?api_key=';
    }
    return '';
  }
}
