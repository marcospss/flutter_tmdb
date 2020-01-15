import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/models/detailModel.dart';
import 'package:the_movie_database/settings/api.dart';

class CommonService {
  Client client = Client();
  final _baseUrl = baseUrl;
  final _apiKey = apikey;

  /*
  * Get Credits
  * Get the cast and crew for a movie.
  * Get the credits (cast and crew) that have been added to a TV show.
  */
  Future<ItemModel> fetchCredits({String mediaType, String mediaId}) async {
    Response response;
    response = await client
        .get("$_baseUrl/$mediaType/$mediaId/credits?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchCredits');
    }
  }

  /*
  * Get Recommendations
  * Get a list of recommended movies for a movie or list of TV show recommendations for this item.
  * @param properties
  */
  Future<ItemModel> fetchRecommendations(
      {String mediaType, String mediaId}) async {
    Response response;
    response = await client
        .get("$_baseUrl/$mediaType/$mediaId/recommendations?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchRecommendations');
    }
  }

  /*
  * Get Similar
  * Get a list of similar movies. This is not the same as the "Recommendation" system you see on the website.
  * Get a list of similar TV shows. These items are assembled by looking at keywords and genres.
  */
  Future<ItemModel> fetchSimilar({String mediaType, String mediaId}) async {
    Response response;
    response = await client
        .get("$_baseUrl/$mediaType/$mediaId/similar?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchSimilar');
    }
  }

  /*
  * Get Popular
  * Get a list of the current popular movies/tv shows on TMDb. This list updates daily.
  */
  Future<ItemModel> fetchPopular(String mediaType) async {
    Response response;
    response =
        await client.get("$_baseUrl/$mediaType/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchPopular');
    }
  }

  /*
  * Get Top Rated
  * Get the top rated movies/tv shows on TMDb.
  */
  Future<ItemModel> fetchTopRated(String mediaType) async {
    Response response;
    response =
        await client.get("$_baseUrl/$mediaType/top_rated?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchTopRated');
    }
  }

  /*
  * Get Details
  * Get the primary information about a movies/tv shows.
  */
  Future<DetailModel> fetchDetail({String mediaType, String mediaId}) async {
    Response response;
    response =
        await client.get("$_baseUrl/$mediaType/$mediaId?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return DetailModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchDetail');
    }
  }

  /*
  * Get Genres
  * Get the list of official genres for movies/TV shows.
  */
  Future<ItemModel> fetchGenres(String mediaType) async {
    Response response;
    response =
        await client.get("$_baseUrl/genre/$mediaType/list?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchGenres');
    }
  }
}
