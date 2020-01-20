import 'package:flutter/material.dart';

import 'package:the_movie_database/models/detailModel.dart';

class RatingInformation extends StatelessWidget {
  const RatingInformation({Key key, this.mediaData}) : super(key: key);

  final DetailModel mediaData;

  _buildRatingBar() {
    var stars = <Widget>[];
    var rate = mediaData.voteAverage / 2;
    for (var i = 0; i < 5; ++i) {
      var color = i <= rate ? Colors.blueGrey : Colors.black26;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mediaData.voteAverage.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ],
    );

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildRatingBar(),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        numericRating,
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: starRating,
        )
      ],
    );
  }
}
