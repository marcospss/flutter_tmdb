import 'package:flutter/material.dart';
import 'package:the_movie_database/utils/DateHelper.dart';
import 'package:transparent_image/transparent_image.dart';

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
    String formatReleaseDate = DateHelper().yearMonthDay(date: airDate);

    final thumbnail = ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Container(
            child: (posterPath != null)
            ? FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://image.tmdb.org/t/p/$sizeImage$posterPath',
            ) : null,
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
                    : 'Coming Soon On',
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
