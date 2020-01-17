import 'package:flutter/material.dart';
import 'package:the_movie_database/blocs/movieBloc.dart';

class MovieBlocProvider extends InheritedWidget {
  final MoviesBloc bloc;

  MovieBlocProvider({Key key, Widget child})
      : bloc = MoviesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static MoviesBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
            aspect: MovieBlocProvider) as MovieBlocProvider)
        .bloc;
  }
}
