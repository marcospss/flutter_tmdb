import 'dart:async';
import 'package:the_movie_database/services/movieService.dart';
import 'package:the_movie_database/services/commonService.dart';
import 'package:the_movie_database/models/itemModel.dart';

class MovieRepository {
  final _movies = MovieService();
  final _common = CommonService();

  Future<ItemModel> fetchNowPlaying() => _movies.fetchNowPlaying();
  Future<ItemModel> fetchUpcoming() => _movies.fetchUpcoming();
  Future<ItemModel> fetchPopular() => _common.fetchPopular('movie');
  Future<ItemModel> fetchTopRated() => _common.fetchTopRated('movie');

}
