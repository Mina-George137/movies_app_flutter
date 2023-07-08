import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/MyTheme.dart';
import 'package:movies_app/category/category_films_screen.dart';
import 'package:movies_app/category/category_screen.dart';
import 'package:movies_app/details/movie_details_screen.dart';
import 'package:movies_app/home/home_Screen.dart';
import 'package:movies_app/home/home_screen_body.dart';
import 'package:movies_app/search/search_screen.dart';
import 'package:movies_app/watchlist/watchlist_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: MyTheme.appTheme,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        HomeScreenBody.routeName : (context) => HomeScreenBody(),
        SearchScreen.routeName : (context) => SearchScreen(),
        CategoryScreen.routeName : (context) => CategoryScreen(),
        WatchlistScreen.routeName : (context) => WatchlistScreen(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
        CategoryFilmsScreen.routeName: (context) => CategoryFilmsScreen(),
      },
      initialRoute: HomeScreen.routeName,


    );
  }
}
