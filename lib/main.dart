import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_movie_app/Providers/movie_provider.dart';
import 'package:my_movie_app/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';
import 'screens/app_homepage_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppHomePageScreen(),
        routes: {
          AppHomePageScreen.route: (context) => AppHomePageScreen(),
          MovieDetailScreen.route: (context) => MovieDetailScreen(),
        },
      ),
    );
  }
}
