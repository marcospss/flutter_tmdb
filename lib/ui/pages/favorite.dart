import 'package:flutter/material.dart';
import 'package:the_movie_database/ui/widgets/cardList.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'A', 'B', 'C'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return CardList();
        },
        separatorBuilder: (
          BuildContext context,
          int index,
        ) =>
            const Divider(
          color: Colors.white,
        ),
      ),
    );
  }
}
