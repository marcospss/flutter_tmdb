import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CardPoster extends StatelessWidget {
  final String _title;
  final String _poster;
  final double containerWidth = 120.0;
  CardPoster(this._title, this._poster);
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
              image: 'https://image.tmdb.org/t/p/w154$_poster',
            ),
          ),
        ),
        Container(
          width: containerWidth,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              _title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
