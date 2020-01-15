import 'package:rxdart/rxdart.dart';
import 'package:the_movie_database/services/DetailRepository.dart';
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/models/detailModel.dart';

class DetailsBloc {

  final _repository = DetailRepository();
  final _detailFetcher = PublishSubject<DetailModel>();
  final _recommendationsFetcher = PublishSubject<ItemModel>();
  final _similarFetcher = PublishSubject<ItemModel>();


  Observable<DetailModel> get details => _detailFetcher.stream;
  Observable<ItemModel> get popular => _recommendationsFetcher.stream;
  Observable<ItemModel> get topRated => _similarFetcher.stream;

  fetchDetail({ String mediaType, String mediaId }) async {
    DetailModel detailModel = await _repository.fetchDetail(mediaType: mediaType, mediaId: mediaId);
    _detailFetcher.sink.add(detailModel);
  }

  fetchRecommendations({ String mediaType, String mediaId }) async {
    ItemModel itemModel = await _repository.fetchRecommendations(mediaType: mediaType, mediaId: mediaId);
    _recommendationsFetcher.sink.add(itemModel);
  }
  
  fetchSimilar({ String mediaType, String mediaId }) async {
    ItemModel itemModel = await _repository.fetchSimilar(mediaType: mediaType, mediaId: mediaId);
    _similarFetcher.sink.add(itemModel);
  }

  dispose() {
    _detailFetcher.close();
    _recommendationsFetcher.close();
    _similarFetcher.close();
  }
}

final bloc = DetailsBloc();