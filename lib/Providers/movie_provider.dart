import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/movie_class.dart';

class MoviesProvider extends ChangeNotifier {
  List<MovieClass> _moviesTrendList = [];

  List<MovieClass> get getTrendMoviesList {
    return [..._moviesTrendList];
  }

  List<MovieClass> _moviesNowList = [];

  List<MovieClass> get getNowMoviesList {
    return [..._moviesNowList];
  }

  List<MovieClass> _moviesTopList = [];

  List<MovieClass> get getTopMoviesList {
    return [..._moviesTopList];
  }

  Map<String, String> movieTypeNameList = {
    'trending': 'Trending',
    'nowPlaying': 'Now Playing',
    'topRated': 'Top Rated',
  };

  Future getTrendingMovies() async {
    final url = Uri.parse('$kTMDBMainUrl/3/trending/all/day?api_key=$kApiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedMoviesData = jsonDecode(response.body);
      final resultMovies = decodedMoviesData['results'];

      for (var movies in resultMovies) {
        var movieTrendClass = MovieClass(
          id: movies['id'],
          title: movies['title'],
          imageURL: movies['poster_path'],
          description: movies['overview'],
          rating: movies['vote_average'],
          poster: movies['backdrop_path'],
        );

        _moviesTrendList.add(movieTrendClass);
      }
    } else {
      print(response.statusCode);
    }
  }

  Future getNowPlayingMovies() async {
    final url = Uri.parse('$kTMDBMainUrl/3/movie/now_playing?api_key=$kApiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedMoviesData = jsonDecode(response.body);
      final resultMovies = decodedMoviesData['results'];

      for (var movies in resultMovies) {
        var movieTrendClass = MovieClass(
          id: movies['id'],
          title: movies['title'],
          imageURL: movies['poster_path'],
          description: movies['overview'],
          rating: movies['vote_average'],
          poster: movies['backdrop_path'],
        );

        _moviesNowList.add(movieTrendClass);
      }
    } else {
      print(response.statusCode);
    }
  }

  Future getTopRatedMovies() async {
    final url = Uri.parse('$kTMDBMainUrl/3/movie/top_rated?api_key=$kApiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedMoviesData = jsonDecode(response.body);
      final resultMovies = decodedMoviesData['results'];

      for (var movies in resultMovies) {
        var movieClass = MovieClass(
          id: movies['id'],
          title: movies['title'],
          imageURL: movies['poster_path'],
          description: movies['overview'],
          rating: movies['vote_average'],
          poster: movies['backdrop_path'],
          // movieCasts: await getMoviesCasts(movies['id']),
        );
        _moviesTopList.add(movieClass);
      }
    } else {
      print(response.statusCode);
    }
  }
}
