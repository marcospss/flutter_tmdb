import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/settings/api.dart';

class MovieService {
  Client _client = Client();
  final _baseUrl = '$baseUrl/movie';
  final _apiKey = apikey;

  /*
  * Get Now Playing
  * Get a list of movies in theatres. This is a release type query that looks for all movies that have a release type of 2 or 3 within the specified date range.
  * You can optionally specify a region prameter which will narrow the search to only look for theatrical release dates within the specified country.
  */
  Future<ItemModel> fetchNowPlaying() async {
    Response response;
    response = await _client.get('$_baseUrl/now_playing?api_key=$_apiKey');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchNowPlaying');
    }
  }

  /*
  * Get Upcoming
  * Get a list of upcoming movies in theatres. This is a release type query that looks for all movies that have a release type of 2 or 3 within the specified date range.
  * You can optionally specify a region prameter which will narrow the search to only look for theatrical release dates within the specified country.
  */
  Future<ItemModel> fetchUpcoming() async {
    Response response;
    response = await _client.get("$_baseUrl/upcoming?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load fetchUpcoming');
    }
  }

}
