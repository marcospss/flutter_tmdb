import 'package:flutter/material.dart';
import 'package:the_movie_database/ui/widgets/carousel.dart';

class Movie extends StatelessWidget {
  final _widthContainerBackdrop = 360.0;
  final _backdropHeight = 200.0;
  final _sizeMainTitle = 24.0;
  final _sizeSubTitle = 20.0;
  final _widthContainerPoster = 140.0;
  final _posterHeight = 240.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: _listMedia(
                'Now Playing Movies',
                _sizeMainTitle,
                _widthContainerBackdrop,
                _backdropHeight,
                'backdrop',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: _listMedia(
                'Popular Movies',
                _sizeSubTitle,
                _widthContainerPoster,
                _posterHeight,
                'poster',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: _listMedia(
                'Top Rated Movies',
                _sizeSubTitle,
                _widthContainerPoster,
                _posterHeight,
                'poster',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: _listMedia(
                'Upcoming Movies',
                _sizeSubTitle,
                _widthContainerPoster,
                _posterHeight,
                'poster',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _setTitleSection({
    String text,
    double size,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: size,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _listMedia(
    String sectionTitle,
    double sizeTitle,
    double containerWidth,
    double containerHeight,
    String typeCard,
  ) {
    return <Widget>[
      _setTitleSection(
        text: sectionTitle,
        size: sizeTitle,
      ),
      Container(
        margin: EdgeInsets.only(bottom: 15.0, left: 15.0),
        height: containerHeight,
        child: Carousel(typeCard, containerWidth),
      ),
    ];
  }
}
