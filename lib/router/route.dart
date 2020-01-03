import 'package:flutter/material.dart';

import 'package:the_movie_database/ui/pages/home.dart';
import 'package:the_movie_database/ui/pages/detail.dart';
import 'package:the_movie_database/ui/pages/search.dart';
import 'package:the_movie_database/ui/pages/discover.dart';
import 'package:the_movie_database/ui/pages/favorite.dart';

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
