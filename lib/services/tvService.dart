import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:the_movie_database/models/itemModel.dart';
import 'package:the_movie_database/models/seasonModel.dart';
import 'package:the_movie_database/settings/api.dart';

class TvService {
  Client _client = Client();
  final _baseUrl = '$baseUrl/tv';
  final _apiKey = apikey;

  /*
  * Get Latest
  * Get the most newly created TV show. This is a live response and will continuously change.
  */
  Future<ItemModel> fetchLatest() async {
    Response response;
    response = await _client.get('$_baseUrl/latest?api_key=$_apiKey');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load getLatest');
    }
  }

  /*
  * Get TV Airing Today
  * Get a list of TV shows that are airing today. This query is purely day based as we do not currently support airing times.
  * You can specify a  to offset the day calculation. Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
  */
  Future<ItemModel> fetchAiringToday() async {
    Response response;
    response = await _client.get('$_baseUrl/airing_today?api_key=$_apiKey');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load getAiringToday');
    }
  }

  /*
  * Get TV On The Air
  * Get a list of shows that are currently on the air.
  * This query looks for any TV show that has an episode with an air date in the next 7 days.
  */
  Future<ItemModel> fetchOnTheAir() async {
    Response response;
    response = await _client.get('$_baseUrl/on_the_air?api_key=$_apiKey');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load getOnTheAir');
    }
  }

  /*
  * Get TV Seasons
  * Get the TV season details by id.
  */
  Future<SeasonModel> fetchSeasonDetailsById({String mediaId, String seasonNumber}) async {
    Response response;
    response = await _client.get('$_baseUrl/$mediaId/season/$seasonNumber?api_key=$_apiKey');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return SeasonModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load getSeasonDetailsById');
    }
  }

}
