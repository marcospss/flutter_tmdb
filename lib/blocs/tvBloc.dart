import 'package:rxdart/rxdart.dart';
import 'package:the_movie_database/services/tvRepository.dart';
import 'package:the_movie_database/models/itemModel.dart';

class TvBloc {
  final _repository = TvRepository();
  final _onTheAirFetcher = PublishSubject<ItemModel>();
  final _popularFetcher = PublishSubject<ItemModel>();
  final _topRatedFetcher = PublishSubject<ItemModel>();
  final _airingTodayFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get onTheAir => _onTheAirFetcher.stream;
  Observable<ItemModel> get popular => _popularFetcher.stream;
  Observable<ItemModel> get topRated => _topRatedFetcher.stream;
  Observable<ItemModel> get airingToday => _airingTodayFetcher.stream;

  fetchOnTheAir() async {
    ItemModel itemModel = await _repository.fetchOnTheAir();
    _onTheAirFetcher.sink.add(itemModel);
  }

  fetchPopular() async {
    ItemModel itemModel = await _repository.fetchPopular();
    _popularFetcher.sink.add(itemModel);
  }
  
  fetchTopRated() async {
    ItemModel itemModel = await _repository.fetchTopRated();
    _topRatedFetcher.sink.add(itemModel);
  }

  fetchAiringToday() async {
    ItemModel itemModel = await _repository.fetchAiringToday();
    _airingTodayFetcher.sink.add(itemModel);
  }

  dispose() {
    _onTheAirFetcher.close();
    _popularFetcher.close();
    _topRatedFetcher.close();
    _airingTodayFetcher.close();
  }
}
// TODO: Verificar como manter a instância -> ERRO: navegação destroi a página.
// final bloc = TvBloc();
