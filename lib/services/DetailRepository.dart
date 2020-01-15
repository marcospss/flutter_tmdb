import 'dart:async';
import 'package:the_movie_database/services/commonService.dart';
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/models/detailModel.dart';

class DetailRepository {
  final _common = CommonService();
  // final String mediaType;
  // final String mediaId;

  // DetailRepository({this.mediaType, this.mediaId});

  Future<DetailModel> fetchDetail({ String mediaType, String mediaId }) => _common.fetchDetail(mediaType: mediaType, mediaId: mediaId);
  Future<ItemModel> fetchRecommendations({ String mediaType, String mediaId }) => _common.fetchRecommendations(mediaType: mediaType, mediaId: mediaId);
  Future<ItemModel> fetchSimilar({ String mediaType, String mediaId }) => _common.fetchSimilar(mediaType: mediaType, mediaId: mediaId);
  
}
