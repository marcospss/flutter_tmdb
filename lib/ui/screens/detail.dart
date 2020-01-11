import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Detail extends StatelessWidget {
  final String _mediaType;
  final String _mediaId;

  Detail(this._mediaType, this._mediaId);

  @override
  Widget build(BuildContext context) {
    final fullSize = MediaQuery.of(context).size.width;
    final posterWidth = 140.0;
    final posterHeight = 240.0;
    final sizeTitleSubSection = 20.0;
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return <Widget>[
              SliverAppBar(
                // title: Text('Star Wars: The Rise of Skywalker'),
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    fit: BoxFit.fitWidth,
                    image:
                        'https://image.tmdb.org/t/p/w780/jOzrELAzFxtMx2I4uDGHOotdfsS.jpg',
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Star Wars: The Rise of Skywalker',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Action | Adventure | Science Fiction',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'The surviving Resistance faces the First Order once again as the journey of Rey, Finn and Poe Dameron continues. With the power and knowledge of generations behind them, the final battle begins.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
