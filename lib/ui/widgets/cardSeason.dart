import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:intl/intl.dart';

class CardSeason extends StatelessWidget {
  final String airDate;
  final int episodeCount;
  final String idSeason;
  final String name;
  final String overview;
  final String posterPath;
  final String seasonNumber;
  final String sizeImage;

  CardSeason({
    this.airDate,
    this.episodeCount,
    this.idSeason,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.sizeImage = 'w92',
  });

  @override
  Widget build(BuildContext context) {
    print(airDate);
    final parseReleaseDate =
        (airDate != null) ? DateFormat('yyyy-MM-dd').parse(airDate) : null;
    final formatReleaseDate = (parseReleaseDate != null)
        ? DateFormat.yMMMMd().format(parseReleaseDate)
        : null;

    final thumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      alignment: FractionalOffset.topLeft,
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: 'https://image.tmdb.org/t/p/$sizeImage$posterPath',
      ),
    );

    final infoSeasonContent = Container(
      margin: EdgeInsets.only(
        top: 6.0,
        left: 80.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: ListTile(
              title: Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                (formatReleaseDate != null)
                    ? 'Air Date: $formatReleaseDate'
                    : '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final infoCard = Container(
      child: infoSeasonContent,
      height: 82.0,
      margin: EdgeInsets.only(
        left: 16.0,
        top: 26.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white60,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
    );

    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Stack(
          children: <Widget>[
            infoCard,
            thumbnail,
          ],
        ));
  }
}
