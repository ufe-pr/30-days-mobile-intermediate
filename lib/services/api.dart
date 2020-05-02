import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moovies/models/movie_model.dart';
import 'package:moovies/hidden_config.dart';


Future<List<Movie>> getMovies({int page = 1, String sort = 'popularity.desc'}) async {
  final response = await http.get('https://api.themoviedb.org/3/discover/movie?api_key=$API_KEY&language=en-US&sort_by=$sort&include_adult=false&include_video=false&page=$page');
  List results = [];
  Map responseDecoded;

  if (response.statusCode == 200) {
    responseDecoded = json.decode(response.body);
    results = responseDecoded['results'];
  } else if (response.statusCode == 401 || response.statusCode == 404) {
    responseDecoded = json.decode(response.body);
    throw Exception(responseDecoded['status_message']);
  } else {
    throw Exception('The movies could not be loaded');
  }


}

