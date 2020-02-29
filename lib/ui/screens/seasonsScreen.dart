import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:the_movie_database/blocs/detailBloc.dart';
import 'package:the_movie_database/models/seasonModel.dart';
import 'package:the_movie_database/ui/widgets/cardBackdrop.dart';

class SeasonScreen extends StatefulWidget {
  final String name;
  final String seasonNumber;
  final String mediaId;
  final String posterPath;

  SeasonScreen({this.name, this.seasonNumber, this.mediaId, this.posterPath});

  @override
  _SeasonScreenState createState() => _SeasonScreenState();
}

class _SeasonScreenState extends State<SeasonScreen> {
  final bloc = DetailsBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchSeasons(
      mediaId: widget.mediaId,
      seasonNumber: widget.seasonNumber,
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${widget.name} Episode List'),
      //   backgroundColor: Colors.transparent,
      // ),
      // body: SafeArea(
      //   child: Container(
      //     width: double.infinity,
      //     margin: EdgeInsets.zero,
      //   child: StreamBuilder(
      //     stream: bloc.seasons,
      //     builder: (context, AsyncSnapshot<SeasonModel> snapshot) {
      //       if (snapshot.hasData) {
      //         return _buildItemList(
      //           snapshot,
      //         );
      //       } else if (snapshot.hasError) {
      //         return Text(
      //           snapshot.error.toString(),
      //         );
      //       }
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     },
      //   ),
      // ),
      // ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    '${widget.name} Episode List',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      shadows: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4.0,
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  background: Container(
                    child: (widget.posterPath != null)
                        ? FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                'https://image.tmdb.org/t/p/w130_and_h195_bestv2${widget.posterPath}',
                          )
                        : null,
                  ),
                ),
              ),
            ];
          },
          body: Container(
            width: double.infinity,
            margin: EdgeInsets.zero,
            child: StreamBuilder(
              stream: bloc.seasons,
              builder: (context, AsyncSnapshot<SeasonModel> snapshot) {
                if (snapshot.hasData) {
                  return _buildItemList(
                    snapshot,
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemList(
    AsyncSnapshot<SeasonModel> snapshot,
  ) {
    final results = snapshot.data.episodes;
    return ListView.builder(
      itemCount: results.length,
      shrinkWrap: true,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return Column(
          children: <Widget>[
            Divider(
              color: Colors.grey,
              height: 20,
            ),
            CardBackdrop(
              '${results[index].episodeNumber}. ${results[index].name}',
              results[index].stillPath,
              results[index].airDate,
              sizeImage: 'w300',
            ),
            Padding(
              padding: EdgeInsets.all(
                20.0,
              ),
              child: Text(
                results[index].overview,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
