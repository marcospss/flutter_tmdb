import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CardPoster extends StatelessWidget {
  final String title;
  final String poster;
  final double containerWidth;
  final String sizeImage;
  final Color colorTitle;

  CardPoster(this.title, this.poster, { this.containerWidth = 120.0, this.sizeImage = 'w154', this.colorTitle = Colors.white });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          child: Container(
            width: containerWidth,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://image.tmdb.org/t/p/$sizeImage$poster',
            ),
          ),
        ),
        Container(
          width: containerWidth,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: colorTitle,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
