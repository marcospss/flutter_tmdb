import 'package:flutter/material.dart';

import 'package:the_movie_database/ui/widgets/cardList.dart';

class SeasonScreen extends StatelessWidget {
  final String name;
  final String overview;
  final int id;

  SeasonScreen({this.name, this.overview, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name Episode List'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(overview),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
