import 'package:flutter/material.dart';
import 'package:the_movie_database/ui/widgets/cardList.dart';
class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'A', 'B', 'C'];
    final fullSize = MediaQuery.of(context).size.width;
    final halfSize = fullSize / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: halfSize,
                  padding: EdgeInsets.all(10.0),
                  child: _dropdownButton('Select the Year!', '1'),
                ),
                Container(
                  width: halfSize,
                  padding: EdgeInsets.all(10.0),
                  child: _dropdownButton('Select the Genre!', '2'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: halfSize,
                  padding: EdgeInsets.all(10.0),
                  child: _dropdownButton('Select the Sort By!', '3'),
                ),
                Container(
                  width: halfSize,
                  padding: EdgeInsets.all(10.0),
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: Colors.black87,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {
                        print("filled background");
                      },
                    ),
                  ),
                ),
              ],
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
        ),
      ),
    );
  }
   DropdownButton _dropdownButton(String hintText, String value) => DropdownButton<String>(
    items: [
      DropdownMenuItem<String>(
        value: "1",
        child: Text(
          "First",
        ),
      ),
      DropdownMenuItem<String>(
        value: "2",
        child: Text(
          "Second",
        ),
      ),
      DropdownMenuItem<String>(
        value: "3",
        child: Text(
          "Third",
        ),
      ),
    ],
    onChanged: (value) {
      print("value: $value");
    },
    hint: Text(
      hintText,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    isExpanded: true,
    underline: Container(
      height: 2,
      color: Colors.transparent,
    ),
    value: value,
  );
}