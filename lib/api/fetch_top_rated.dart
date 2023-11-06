import 'dart:convert';
import 'package:http/http.dart' as http;


/// Function to fetch data from API
Future<Map<String, dynamic>> fetchTopRatedMovies() async {
  final response = await http.get(
      Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1"
      ),
      headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODM5ODc3MzFkZjZiM2VhMTQzYWJiODQzNmFlNTM2ZCIsInN1YiI6IjY1NDFjNDgwZTFhZDc5MDBlYTU2ZjM0ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5H-oyLUSZ3QbDLOJ1LtjGm9W2XOHM6jQRMjxCHQWxig"
      });

  // If the server did return a 200 OK response, parse the JSON and return it.
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }

  // If the server did not return a 200 OK response, throw an exception.
  else {
    throw Exception("Failed to load movies in theatres!");
  }
}