import 'package:flutter/material.dart';

import 'package:the_movie_database/ui/screens/homeScreen.dart';
import 'package:the_movie_database/ui/screens/detailScreen.dart';
import 'package:the_movie_database/ui/screens/seasonsScreen.dart';
import 'package:the_movie_database/ui/screens/searchScreen.dart';
import 'package:the_movie_database/ui/screens/discoverScreen.dart';
import 'package:the_movie_database/ui/screens/favoriteScreen.dart';

import 'package:the_movie_database/utils/screenArguments.dart';
import 'package:the_movie_database/utils/screenSeasonsArguments.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/detail':
        final ScreenArguments args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => DetailScreen(
            mediaType: args.mediaType,
            mediaId: args.mediaId,
            mediaTitle: args.mediaTitle,
          ),
        );
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
      case '/seasons':
        final ScreenSeasonsArguments argsSeasons = settings.arguments;
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return SeasonScreen(
              name: argsSeasons.seasonName,
              seasonNumber: argsSeasons.seasonId,
              mediaId: argsSeasons.mediaId,
              posterPath: argsSeasons.posterPath,
            );
          },
        );
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
