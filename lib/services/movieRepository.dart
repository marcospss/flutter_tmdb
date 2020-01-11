import 'dart:async';
import 'package:the_movie_database/services/movie.dart';
import 'package:the_movie_database/services/common.dart';
import 'package:the_movie_database/models/itemModel.dart';

class MovieRepository {
  final _movies = Movie();
  final _common = Common();

  Future<ItemModel> fetchNowPlaying() => _movies.fetchNowPlaying();
  Future<ItemModel> fetchUpcoming() => _movies.fetchUpcoming();
  Future<ItemModel> fetchPopular() => _common.fetchPopular('movie');
  Future<ItemModel> fetchTopRated() => _common.fetchTopRated('movie');

}
