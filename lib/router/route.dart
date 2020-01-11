import 'package:flutter/material.dart';

import 'package:the_movie_database/ui/screens/home.dart';
import 'package:the_movie_database/ui/screens/detail.dart';
import 'package:the_movie_database/ui/screens/search.dart';
import 'package:the_movie_database/ui/screens/discover.dart';
import 'package:the_movie_database/ui/screens/favorite.dart';

import 'package:the_movie_database/utils/screenArguments.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/detail':
        final ScreenArguments args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => Detail(
            args.mediaType,
            args.mediaId,
          ),
        );
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
      case '/discover':
        return MaterialPageRoute(builder: (_) => Discover());
      case '/favorites':
        return MaterialPageRoute(builder: (_) => Favorite());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
