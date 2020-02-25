import 'package:flutter/material.dart';

import 'package:the_movie_database/blocs/detailBloc.dart';
import 'package:the_movie_database/models/seasonModel.dart';

class SeasonScreen extends StatefulWidget {
  final String name;
  final String seasonNumber;
  final String mediaId;

  SeasonScreen({this.name, this.seasonNumber, this.mediaId});

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
      appBar: AppBar(
        title: Text('${widget.name} Episode List'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
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
            ListTile(
              title: Text(
                  '${results[index].episodeNumber}. ${results[index].name}'),
              subtitle: Text(results[index].airDate),
            ),
          ],
        );
      },
    );
  }
}
