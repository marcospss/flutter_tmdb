import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:the_movie_database/models/detailModel.dart';
import 'package:the_movie_database/ui/widgets/ratingInformation.dart';

class DetailHeader extends StatelessWidget {
  final DetailModel mediaData;

  const DetailHeader({Key key, this.mediaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _movieInformation = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 74.0,
        ),
        Text(
          mediaData.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          mediaData.genres.map((f) => f.name).join(' | '),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        RatingInformation(mediaData: mediaData),
      ],
    );

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 352.0,
          padding: EdgeInsets.only(
            bottom: 120.0,
          ),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            fit: BoxFit.fitWidth,
            image: 'https://image.tmdb.org/t/p/w780${mediaData.backdropPath}',
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    fit: BoxFit.fitWidth,
                    image: (mediaData.posterPath != null)
                        ? 'https://image.tmdb.org/t/p/w154${mediaData.posterPath}'
                        : AssetImage('images/no-image-available.jpg'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: _movieInformation,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
