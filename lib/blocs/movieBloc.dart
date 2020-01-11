import 'package:rxdart/rxdart.dart';
import 'package:the_movie_database/services/movieRepository.dart';
import 'package:the_movie_database/models/itemModel.dart';

class MoviesBloc {
  final _repository = MovieRepository();
  final _nowPlayingFetcher = PublishSubject<ItemModel>();
  final _popularFetcher = PublishSubject<ItemModel>();
  final _topRatedFetcher = PublishSubject<ItemModel>();
  final _upcomingFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get nowPlaying => _nowPlayingFetcher.stream;
  Observable<ItemModel> get popular => _popularFetcher.stream;
  Observable<ItemModel> get topRated => _topRatedFetcher.stream;
  Observable<ItemModel> get upcoming => _upcomingFetcher.stream;

  fetchNowPlaying() async {
    ItemModel itemModel = await _repository.fetchNowPlaying();
    _nowPlayingFetcher.sink.add(itemModel);
  }

  fetchPopular() async {
    ItemModel itemModel = await _repository.fetchPopular();
    _popularFetcher.sink.add(itemModel);
  }
  
  fetchTopRated() async {
    ItemModel itemModel = await _repository.fetchTopRated();
    _topRatedFetcher.sink.add(itemModel);
  }

  fetchUpcoming() async {
    ItemModel itemModel = await _repository.fetchUpcoming();
    _upcomingFetcher.sink.add(itemModel);
  }

  dispose() {
    _nowPlayingFetcher.close();
    _popularFetcher.close();
    _topRatedFetcher.close();
    _upcomingFetcher.close();
  }
}

final bloc = MoviesBloc();
