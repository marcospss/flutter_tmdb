import 'package:flutter/material.dart';
import 'package:the_movie_database/blocs/tvBloc.dart';

class TvBlocProvider extends InheritedWidget {
  final TvBloc bloc;

  TvBlocProvider({Key key, Widget child})
      : bloc = TvBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static TvBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
            aspect: TvBlocProvider) as TvBlocProvider)
        .bloc;
  }
}
