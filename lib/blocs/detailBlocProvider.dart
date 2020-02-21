import 'package:flutter/material.dart';
import 'package:the_movie_database/blocs/detailBloc.dart';

class DetailsBlocProvider extends InheritedWidget {
  final DetailsBloc bloc;

  DetailsBlocProvider({Key key, Widget child})
      : bloc = DetailsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static DetailsBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
            aspect: DetailsBlocProvider) as DetailsBlocProvider)
        .bloc;
  }
}
