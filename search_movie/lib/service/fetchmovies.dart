import 'package:search_movie/model/movie_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<Movie>> fetchmovie(String searchterm) async{
  print('fetching started...');
  List<Movie> movies =[];
  var url = Uri.parse('http://www.omdbapi.com/?apikey=3b1235bf&s=$searchterm');
  http.Response response=await http.get(url);
  
  Map<String,dynamic> json = jsonDecode(response.body);
  for (var item in json['Search']) {
    movies.add(Movie.fromMap(item));
  }
  
return movies;
}
