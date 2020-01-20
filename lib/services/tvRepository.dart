import 'dart:async';
import 'package:the_movie_database/services/tvService.dart';
import 'package:the_movie_database/services/commonService.dart';
import 'package:the_movie_database/models/itemModel.dart';

class TvRepository {
  final _tv = TvService();
  final _common = CommonService();

  Future<ItemModel> fetchOnTheAir() => _tv.fetchOnTheAir();
  Future<ItemModel> fetchAiringToday() => _tv.fetchAiringToday();
  Future<ItemModel> fetchPopular() => _common.fetchPopular('tv');
  Future<ItemModel> fetchTopRated() => _common.fetchTopRated('tv');

}
