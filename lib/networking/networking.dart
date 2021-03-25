import 'dart:convert';
import '../models/movie_class.dart';
import 'package:http/http.dart' as http;

class TMDBNetworking {
  static Future<List<MovieClass>> getAllMovies(String moviesUrl) async {
    List<MovieClass> moviesAllList = [];
    final url = Uri.parse(moviesUrl);
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

        moviesAllList.add(movieTrendClass);
      }
    } else {
      print(response.statusCode);
    }
    return moviesAllList;
  }
}
