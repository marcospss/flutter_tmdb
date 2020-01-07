import 'package:flutter/material.dart';

import 'package:the_movie_database/ui/widgets/cardBackdrop.dart';
import 'package:the_movie_database/ui/widgets/cardPoster.dart';
import 'package:the_movie_database/utils/screenArguments.dart';

class Carousel extends StatelessWidget {
  final imageWidth;
  final typeCard;

  Carousel(this.typeCard, this.imageWidth);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: imageWidth,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: ScreenArguments(
              'movie',
              '1974',
            ),
          );
        },
        child: (typeCard == 'backdrop')
            ? CardBackdrop(
                'Star Wars: The Rise of Skywalker',
                '/jOzrELAzFxtMx2I4uDGHOotdfsS.jpg',
                '2019-12-18',
              )
            : CardPoster(
                'Star Wars: The Last Jedi',
                '/kOVEVeg59E0wsnXmF9nrh6OmWII.jpg',
              ),
      ),
      itemCount: 5,
    );
  }
}
