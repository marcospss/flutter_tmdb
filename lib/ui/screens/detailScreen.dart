import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:the_movie_database/blocs/detailBloc.dart';
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/models/detailModel.dart';

class Detail extends StatefulWidget {
  final String mediaType;
  final String mediaId;

  Detail({this.mediaType, this.mediaId});

  @override
  _DetailState createState() =>
      _DetailState(mediaType: this.mediaType, mediaId: this.mediaId);
}

class _DetailState extends State<Detail> {
  final String mediaType;
  final String mediaId;

  _DetailState({this.mediaType, this.mediaId});

  @override
  void initState() {
    super.initState();
    bloc.fetchDetail(mediaType: this.mediaType, mediaId: this.mediaId);
    bloc.fetchRecommendations(mediaType: this.mediaType, mediaId: this.mediaId);
    bloc.fetchSimilar(mediaType: this.mediaType, mediaId: this.mediaId);
  }

  @override
  Widget build(BuildContext context) {
    final fullSize = MediaQuery.of(context).size.width;
    final posterWidth = 140.0;
    final posterHeight = 240.0;
    final sizeTitleSubSection = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminator: Dark Fate Terminator Terminator'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildStack(fullSize),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    _overview(),
                    Divider(
                      color: Colors.black,
                      height: 60,
                    ),
                    _setTitleSection(
                      text: 'Recommendations',
                      size: sizeTitleSubSection,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 15.0,
                        left: 5.0,
                      ),
                      height: posterHeight,
                      child: ListView.builder(
                        itemExtent: posterWidth,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Text('POSTER'),
                        itemCount: 20,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 60,
                    ),
                    _setTitleSection(
                      text: 'Similar',
                      size: sizeTitleSubSection,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 15.0,
                        left: 5.0,
                      ),
                      height: posterHeight,
                      child: ListView.builder(
                        itemExtent: posterWidth,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Text('POSTER'),
                        itemCount: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _overview() => Container(
        padding: EdgeInsets.only(
          top: 40.0,
          left: 10.0,
          bottom: 10.0,
        ),
        child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      );

  Widget _buildStack(double fullSize) => Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 352.0,
            padding: EdgeInsets.only(
              bottom: 120.0,
            ),
            // child: FadeInImage.memoryNetwork(
            //   placeholder: kTransparentImage,
            //   fit: BoxFit.fitWidth,
            //   image:
            //       'https://image.tmdb.org/t/p/w780/a6cDxdwaQIFjSkXf7uskg78ZyTq.jpg',
            // ),
            child: StreamBuilder(
              stream: bloc.details,
              builder: (context, AsyncSnapshot<DetailModel> snapshot) {
                if (snapshot.hasData) {
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 20.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 120.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      fit: BoxFit.fitWidth,
                      image:
                          'https://image.tmdb.org/t/p/w154/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
                    ),
                  ),
                ),
                Container(
                  width: fullSize - 120.0,
                  margin: EdgeInsets.only(top: 60.0),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Terminator: Dark Fate Terminator Terminator: Dark Fate Terminator Dark Fate Terminator',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Terminator | Dark Fate | Terminator | Terminator | Dark Fate | Terminator | Dark Fate | Terminator',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _setTitleSection({
    String text,
    double size,
  }) =>
      ListTile(
        title: Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: size,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
}
