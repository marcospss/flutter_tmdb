import 'package:flutter/material.dart';

import 'package:the_movie_database/ui/widgets/cardBackdrop.dart';
import 'package:the_movie_database/ui/widgets/cardPoster.dart';

class Carousel extends StatelessWidget {
  final String typeCard;
  final String title;
  final String imagePath;
  final String releaseDate;

  Carousel(
    this.typeCard,
    this.title,
    this.imagePath,
    this.releaseDate,
  );

  @override
  Widget build(BuildContext context) {
    return (typeCard == 'backdrop')
        ? CardBackdrop(
            title,
            imagePath,
            releaseDate,
          )
        : CardPoster(
            title,
            imagePath,
          );
  }
}
