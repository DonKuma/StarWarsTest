import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/starwars_model.dart';

class GenerationService {
  Future<StartWars> getStarWars() async {
    StartWars startWars = StartWars();
    const url =
        'http://api.themoviedb.org/3/movie/11/credits?api_key=10e5f764a257048e63ff7f369acde821';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      startWars = StartWars.fromJson(jsonDecode(response.body));
    }
    return startWars;
    // throw "Something went wrong";
  }
}
