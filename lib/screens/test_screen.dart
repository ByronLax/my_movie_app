import 'package:flutter/material.dart';
import 'package:my_movie_app/networking/networking.dart';
import 'package:provider/provider.dart';
import '../Providers/movie_provider.dart';
import '../constants.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),

      // Container(
      //   height: 600,
      //   child: FutureBuilder(
      //     future: TMDBNetworking.getAllMovies(
      //         '$kTMDBMainUrl/3/movie/top_rated?api_key=$kApiKey'),
      //     builder: (context, snapshot) => ListView.builder(
      //         itemCount: movieProvider.titleList.length,
      //         itemBuilder: (context, index) => Container(
      //               child: Text('${movieProvider.titleList[index].title}'),
      //             )),
      //   ),
      // ),
    );
  }
}
