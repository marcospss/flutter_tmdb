import 'package:flutter/material.dart';
import 'package:the_movie_database/ui/widgets/cardList.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'A', 'B', 'C'];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white54,
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
              child: TextField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Find Movies and TV Shows',
                  icon: Icon(Icons.search),
                  focusColor: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return CardList();
              },
              separatorBuilder: (BuildContext context, int index) => const Divider( color: Colors.white,),
            ),
          ),
        ],
      )
    );
  }
}
