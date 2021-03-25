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

  List<MovieClass> _moviesTopList = [];

  List<MovieClass> get getTopMoviesList {
    return [..._moviesTopList];
  }

  List<MovieClass> _moviesPopularList = [];

  List<MovieClass> get getPopularMoviesList {
    return [..._moviesPopularList];
  }

  List<MovieClass> _moviesNowPlayingList = [];

  List<MovieClass> get getNowPayingMoviesList {
    return [..._moviesNowPlayingList];
  }

  List<MovieClass> _moviesUpComingList = [];

  List<MovieClass> get getUpComingList {
    return [..._moviesUpComingList];
  }

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
    notifyListeners();
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
        );
        _moviesTopList.add(movieClass);
      }
    } else {
      print(response.statusCode);
    }
    notifyListeners();
  }

  Future getPopularMovies() async {
    final url = Uri.parse('$kTMDBMainUrl/3/movie/popular?api_key=$kApiKey');
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
        );
        _moviesPopularList.add(movieClass);
      }
    } else {
      print(response.statusCode);
    }
    notifyListeners();
  }

  Future getNowPLayingMovies() async {
    final url = Uri.parse('$kTMDBMainUrl/3/movie/now_playing?api_key=$kApiKey');
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
        );
        _moviesNowPlayingList.add(movieClass);
      }
    } else {
      print(response.statusCode);
    }
    notifyListeners();
  }

  Future getUpComingMovies() async {
    final url = Uri.parse('$kTMDBMainUrl/3/movie/upcoming?api_key=$kApiKey');
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
        );
        _moviesUpComingList.add(movieClass);
      }
    } else {
      print(response.statusCode);
    }
    notifyListeners();
  }
}
