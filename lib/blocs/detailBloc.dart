import 'package:rxdart/rxdart.dart';
import 'package:the_movie_database/services/DetailRepository.dart';
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/models/detailModel.dart';
import 'package:the_movie_database/models/seasonModel.dart';

class DetailsBloc {

  final _repository = DetailRepository();
  final _detailFetcher = PublishSubject<DetailModel>();
  final _recommendationsFetcher = PublishSubject<ItemModel>();
  final _similarFetcher = PublishSubject<ItemModel>();
  final _seasonsFetcher = PublishSubject<SeasonModel>();

  Observable<DetailModel> get details => _detailFetcher.stream;
  Observable<ItemModel> get recommendations => _recommendationsFetcher.stream;
  Observable<ItemModel> get similar => _similarFetcher.stream;
  Observable<SeasonModel> get seasons => _seasonsFetcher.stream;

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

  fetchSeasons({ String mediaId, String seasonNumber }) async {
    SeasonModel seasonModel = await _repository.fetchSeasons(mediaId: mediaId, seasonNumber: seasonNumber);
    _seasonsFetcher.sink.add(seasonModel);
  }

  dispose() {
    _detailFetcher.close();
    _recommendationsFetcher.close();
    _similarFetcher.close();
    _seasonsFetcher.close();
  }
}

// final bloc = DetailsBloc();