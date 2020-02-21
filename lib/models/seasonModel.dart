class SeasonModel {
  String sId;
  String airDate;
  List<Episodes> episodes;
  String name;
  String overview;
  int id;
  String posterPath;
  int seasonNumber;

  SeasonModel({
    this.sId,
    this.airDate,
    this.episodes,
    this.name,
    this.overview,
    this.id,
    this.posterPath,
    this.seasonNumber,
  });

  SeasonModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    airDate = json['air_date'];
    if (json['episodes'] != null) {
      episodes = new List<Episodes>();
      json['episodes'].forEach((v) {
        episodes.add(new Episodes.fromJson(v));
      });
    }
    name = json['name'];
    overview = json['overview'];
    id = json['id'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['air_date'] = this.airDate;
    if (this.episodes != null) {
      data['episodes'] = this.episodes.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['id'] = this.id;
    data['poster_path'] = this.posterPath;
    data['season_number'] = this.seasonNumber;
    return data;
  }
}

class Episodes {
  String airDate;
  int episodeNumber;
  int id;
  String name;
  String overview;
  String productionCode;
  int seasonNumber;
  int showId;
  String stillPath;
  double voteAverage;
  int voteCount;
  List<Crew> crew;
  List<GuestStars> guestStars;

  Episodes({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
  });

  Episodes.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    if (json['crew'] != null) {
      crew = new List<Crew>();
      json['crew'].forEach((v) {
        crew.add(new Crew.fromJson(v));
      });
    }
    if (json['guest_stars'] != null) {
      guestStars = new List<GuestStars>();
      json['guest_stars'].forEach((v) {
        guestStars.add(new GuestStars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_number'] = this.episodeNumber;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['production_code'] = this.productionCode;
    data['season_number'] = this.seasonNumber;
    data['show_id'] = this.showId;
    data['still_path'] = this.stillPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    if (this.crew != null) {
      data['crew'] = this.crew.map((v) => v.toJson()).toList();
    }
    if (this.guestStars != null) {
      data['guest_stars'] = this.guestStars.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Crew {
  int id;
  String creditId;
  String name;
  String department;
  String job;
  int gender;
  String profilePath;

  Crew({
    this.id,
    this.creditId,
    this.name,
    this.department,
    this.job,
    this.gender,
    this.profilePath,
  });

  Crew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creditId = json['credit_id'];
    name = json['name'];
    department = json['department'];
    job = json['job'];
    gender = json['gender'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['credit_id'] = this.creditId;
    data['name'] = this.name;
    data['department'] = this.department;
    data['job'] = this.job;
    data['gender'] = this.gender;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class GuestStars {
  int id;
  String name;
  String creditId;
  String character;
  int order;
  int gender;
  String profilePath;

  GuestStars({
    this.id,
    this.name,
    this.creditId,
    this.character,
    this.order,
    this.gender,
    this.profilePath,
  });

  GuestStars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    creditId = json['credit_id'];
    character = json['character'];
    order = json['order'];
    gender = json['gender'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['credit_id'] = this.creditId;
    data['character'] = this.character;
    data['order'] = this.order;
    data['gender'] = this.gender;
    data['profile_path'] = this.profilePath;
    return data;
  }
}
