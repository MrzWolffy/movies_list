import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_list/models/movie_model.dart';

class MoviesService {
  final String baseUrl = "https://whoa.onrender.com/whoas/random?results=20";
  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
