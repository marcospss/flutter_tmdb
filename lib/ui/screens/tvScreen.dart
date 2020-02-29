import 'package:flutter/material.dart';
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/blocs/tvBloc.dart';
import 'package:the_movie_database/ui/widgets/carousel.dart';
import 'package:the_movie_database/utils/screenArguments.dart';

class Tv extends StatefulWidget {
  @override
  _TvState createState() => _TvState();
}

class _TvState extends State<Tv> {
  final _widthContainerBackdrop = 360.0;
  final _backdropHeight = 200.0;
  final _sizeMainTitle = 24.0;
  final _sizeSubTitle = 20.0;
  final _widthContainerPoster = 140.0;
  final _posterHeight = 240.0;
  final bloc = TvBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchPopular();
    bloc.fetchTopRated();
    bloc.fetchOnTheAir();
    bloc.fetchAiringToday();
  }

  // TODO: Corrigir o erro de carregamento quando voltar para página
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: _mediaList(
                'Popular TV Shows',
                _sizeMainTitle,
                _widthContainerBackdrop,
                _backdropHeight,
                'backdrop',
                bloc.popular,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: _mediaList(
                'Top Rated TV Shows',
                _sizeSubTitle,
                _widthContainerPoster,
                _posterHeight,
                'poster',
                bloc.topRated,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: _mediaList(
                'Currently Airing TV Shows',
                _sizeSubTitle,
                _widthContainerPoster,
                _posterHeight,
                'poster',
                bloc.onTheAir,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: _mediaList(
                'TV Shows Airing Today',
                _sizeSubTitle,
                _widthContainerPoster,
                _posterHeight,
                'poster',
                bloc.airingToday,
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

  List<Widget> _mediaList(
    String sectionTitle,
    double sizeTitle,
    double containerWidth,
    double containerHeight,
    String typeCard,
    mediaData,
  ) {
    return <Widget>[
      _setTitleSection(
        text: sectionTitle,
        size: sizeTitle,
      ),
      Container(
        margin: EdgeInsets.only(bottom: 15.0, left: 15.0),
        height: containerHeight,
        child: StreamBuilder(
          stream: mediaData,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return _buildItemList(
                containerWidth,
                typeCard,
                snapshot,
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      )
    ];
  }

  Widget _buildItemList(
    double containerWidth,
    String typeCard,
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
              mediaType: 'tv',
              mediaId: results[index].id.toString(),
              mediaTitle: results[index].title,
            ),
          );
        },
        child: Carousel(
          typeCard,
          results[index].title,
          (typeCard == 'backdrop' ) ? results[index].backdropPath : results[index].posterPath,
          results[index].releaseDate,
        ),
      ),
      itemCount: results.length,
    );
  }

}
