import 'package:flutter/material.dart';
import 'package:the_movie_database/ui/screens/movieScreen.dart';
import 'package:the_movie_database/ui/screens/tvScreen.dart';
import 'package:the_movie_database/ui/screens/searchScreen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final _pages = [
    Movie(),
    Tv(),
    Search(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    var bottomNavigationPages = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          title: Text('Movies'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          title: Text('TV'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber,
      onTap: _onItemTapped,
    );

    var drawerPages = <Widget>[
      _createHeader(),
      _createDrawerItem(
        context: context,
        icon: Icons.home,
        page: 'Home',
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      _createDrawerItem(
        icon: Icons.find_in_page,
        page: 'Discover',
        onTap: () {
          Navigator.pushNamed(context, '/discover');
        },
      ),
      _createDrawerItem(
        icon: Icons.favorite,
        page: 'Favorites',
        onTap: () {
          Navigator.pushNamed(context, '/favorites');
        },
      ),
      Divider(),
      ListTile(
        title: Text('0.0.1'),
        onTap: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('The Movie Database (TMDb)'),
      ),
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          children: drawerPages,
        ),
      ),
      bottomNavigationBar: bottomNavigationPages,
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/cover.jpg')
        )
      ),
      child: Stack(children: <Widget>[
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text('The Movie Database (TMDb)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500
            )
          ),
        ),
      ]));
  }

  Widget _createDrawerItem(
    {
      BuildContext context,
      IconData icon,
      String page,
      GestureTapCallback onTap
    }
  ) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(page),
          )
        ],
      ),
      onTap: onTap,
    );
  }

}
