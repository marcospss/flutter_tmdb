class ItemModel {
  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _totalResults = parsedJson['totalResults'];
    _totalPages = parsedJson['totalPages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}

class _Result {
  int _voteCount;
  int _id;
  bool _video;
  String _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds = [];
  List<String> _originCountry = [];
  String _backdropPath;
  bool _adult = false;
  String _overview;
  String _releaseDate;

  _Result(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'].toString();
    _title = (result['title'] != null) ? result['title'] : result['name'];
    _popularity = result['popularity'].toDouble();
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = (result['original_title'] != null) ? result['original_title'] : result['original_name'];
    
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }

    if(result['origin_country'] != null) {
      for (int i = 0; i < result['origin_country'].length; i++) {
        _originCountry.add(result['origin_country'][i]);
      }
    }

    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = (result['release_date'] != null) ? result['release_date'] : result['first_air_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  String get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}
