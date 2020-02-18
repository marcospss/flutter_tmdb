import 'package:flutter/material.dart';

import 'package:the_movie_database/ui/widgets/detailHeader.dart';
import 'package:the_movie_database/blocs/detailBloc.dart';
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/models/detailModel.dart';
import 'package:the_movie_database/utils/screenArguments.dart';
import 'package:the_movie_database/utils/screenSeasonsArguments.dart';
import 'package:the_movie_database/ui/widgets/cardPoster.dart';
import 'package:the_movie_database/ui/widgets/cardSeason.dart';

class Detail extends StatefulWidget {
  final String mediaType;
  final String mediaId;
  final String mediaTitle;

  Detail({this.mediaType, this.mediaId, this.mediaTitle});

  @override
  _DetailState createState() =>
      _DetailState(mediaType: this.mediaType, mediaId: this.mediaId, mediaTitle: this.mediaTitle);
}

class _DetailState extends State<Detail> {
  final String mediaType;
  final String mediaId;
  final String mediaTitle;
  final bloc = DetailsBloc();

  _DetailState({this.mediaType, this.mediaId, this.mediaTitle});

  @override
  void initState() {
    super.initState();
    bloc.fetchDetail(mediaType: this.mediaType, mediaId: this.mediaId);
    bloc.fetchRecommendations(mediaType: this.mediaType, mediaId: this.mediaId);
    bloc.fetchSimilar(mediaType: this.mediaType, mediaId: this.mediaId);
  }

  // TODO: Corrigir o erro de carregamento quando voltar para página
  // @override
  // void dispose() {
  //   bloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final _widthContainerPoster = 140.0;
    final _posterHeight = 240.0;
    final _sizeSubTitle = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.mediaTitle),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: bloc.details,
                builder: (context, AsyncSnapshot<DetailModel> snapshot) {
                  if (snapshot.hasData) {
                    final result = snapshot.data;
                    return Column(
                      children: <Widget>[
                        DetailHeader(mediaData: result),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 20.0,
                              bottom: 30.0,
                              left: 20.0,
                            ),
                            child: _overview(result.overview),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              StreamBuilder(
                stream: bloc.details,
                builder: (context, AsyncSnapshot<DetailModel> snapshot) {
                  if (snapshot.hasData && snapshot.data.seasons != null) {
                    return Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.black,
                          height: 20,
                        ),
                        _setTitleSection(
                          text: 'Seasons',
                          size: _sizeSubTitle,
                          colorTitle: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20.0,
                            left: 5.0,
                          ),
                          height: 150.0,
                          child: _buildSeasonList(
                            containerWidth: _widthContainerPoster,
                            snapshot: snapshot.data.seasons,
                            colorTitle: Colors.white,
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: null);
                },
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  vertical: 30.0,
                ),
                padding: EdgeInsets.all(
                  20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    _setTitleSection(
                      text: 'Recommendations',
                      size: _sizeSubTitle,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 15.0,
                        left: 5.0,
                      ),
                      height: _posterHeight,
                      child: StreamBuilder(
                        stream: bloc.recommendations,
                        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                          if (snapshot.hasData) {
                            return _buildItemList(
                              containerWidth: _widthContainerPoster,
                              snapshot: snapshot.data.results,
                            );
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 60,
                    ),
                    _setTitleSection(
                      text: 'Similar',
                      size: _sizeSubTitle,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 15.0,
                        left: 5.0,
                      ),
                      height: _posterHeight,
                      child: StreamBuilder(
                        stream: bloc.similar,
                        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                          if (snapshot.hasData) {
                            return _buildItemList(
                              containerWidth: _widthContainerPoster,
                              snapshot: snapshot.data.results,
                            );
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _overview(String overview) => Container(
        padding: EdgeInsets.only(
          top: 40.0,
          left: 10.0,
          bottom: 10.0,
        ),
        child: Text(
          overview,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      );

  Widget _setTitleSection({
    String text,
    double size,
    Color colorTitle = Colors.black,
  }) =>
      ListTile(
        title: Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: colorTitle,
                fontSize: size,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Widget _buildItemList(
      {double containerWidth, snapshot, Color colorTitle = Colors.black}) {
    final results = snapshot;
    return ListView.builder(
      itemExtent: containerWidth,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: ScreenArguments(
              this.mediaType,
              results[index].id.toString(),
              results[index].title,
            ),
          );
        },
        child: CardPoster(
          results[index].title,
          results[index].posterPath,
          colorTitle: colorTitle,
        ),
      ),
      itemCount: results.length,
    );
  }

  Widget _buildSeasonList(
      {double containerWidth, snapshot, Color colorTitle = Colors.black}) {
    final results = snapshot;
    return ListView.builder(
      itemExtent: 320.0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/seasons',
            arguments: ScreenSeasonsArguments(
              results[index].name,
              results[index].overview,
              results[index].id,
            )
          );
        },
        child: CardSeason(
          name: results[index].name,
          episodeCount: results[index].episodeCount,
          posterPath: results[index].posterPath,
          airDate: results[index].airDate,
        ),
      ),
      itemCount: results.length,
    );
  }
}
