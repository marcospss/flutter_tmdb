import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:the_movie_database/blocs/detailBloc.dart';
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/models/detailModel.dart';
import 'package:the_movie_database/utils/screenArguments.dart';
import 'package:the_movie_database/ui/widgets/cardPoster.dart';

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
  final bloc = DetailsBloc();

  _DetailState({this.mediaType, this.mediaId});

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
    final _fullSize = MediaQuery.of(context).size.width;
    final _widthContainerPoster = 140.0;
    final _posterHeight = 240.0;
    final _sizeSubTitle = 20.0;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminator: Dark Fate Terminator Terminator'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: StreamBuilder(
              stream: bloc.details,
              builder: (context, AsyncSnapshot<DetailModel> snapshot) {
                if (snapshot.hasData) {
                  final result = snapshot.data;
                  return Column(
                    children: <Widget>[
                      _buildStack(_fullSize, result),
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
                            _overview(result.overview),
                            Divider(
                              color: Colors.black,
                              height: 60,
                            ),
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
                                builder: (context,
                                    AsyncSnapshot<ItemModel> snapshot) {
                                  if (snapshot.hasData) {
                                    return _buildItemList(
                                      _widthContainerPoster,
                                      snapshot,
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  }
                                  return Center(
                                      child: CircularProgressIndicator());
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
                                builder: (context,
                                    AsyncSnapshot<ItemModel> snapshot) {
                                  if (snapshot.hasData) {
                                    return _buildItemList(
                                      _widthContainerPoster,
                                      snapshot,
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  }
                                  return Center(
                                      child: CircularProgressIndicator());
                                },
                              ),
                            ),
                          ],
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

  Widget _buildStack(double _fullSize, mediaData) => Stack(
        children: <Widget>[
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
                          'https://image.tmdb.org/t/p/w154${mediaData.posterPath}',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60.0),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          mediaData.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        // https://github.com/ibhavikmakwana/Fluttery-Filmy - Solução titulo
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

  Widget _buildItemList(
    double containerWidth,
    AsyncSnapshot<ItemModel> snapshot,
  ) {
    final results = snapshot.data.results;
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
            ),
          );
        },
        child: CardPoster(
          results[index].title,
          results[index].posterPath,
          colorTitle: Colors.black,
        ),
      ),
      itemCount: results.length,
    );
  }
}
