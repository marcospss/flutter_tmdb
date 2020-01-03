import 'package:flutter/material.dart';
import 'package:the_movie_database/router/route.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'The Movie Database (TMDb)',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff212121),
        accentColor: Color(0xffbdbdbd),
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: '/',
    )
  );
}
