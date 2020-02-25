import 'package:flutter/material.dart';
import 'package:the_movie_database/utils/DateHelper.dart';

class CardBackdrop extends StatelessWidget {
  final String title;
  final String backdrop;
  final String releaseDate;
  final String sizeImage;
  // https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html

  CardBackdrop(this.title, this.backdrop, this.releaseDate,
      {this.sizeImage = 'w300'});

  @override
  Widget build(BuildContext context) {
    String formatReleaseDate = DateHelper().yearMonthDay(date: releaseDate);
    final size = MediaQuery.of(context).size.width;
    return Container(
      width: size,
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(14.0),
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: (backdrop != null)
                ? NetworkImage('https://image.tmdb.org/t/p/$sizeImage$backdrop')
                : AssetImage('images/no-image-available.jpg'),
          )),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Colors.black38,
              child: ListTile(
                title: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'Release Date: $formatReleaseDate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
