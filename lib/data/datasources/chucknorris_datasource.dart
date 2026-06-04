import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';

class ChuckNorrisDataSource {
  final String baseUrl = "https://api.chucknorris.io/jokes";

  Future<List<JokeModel>> fetchRandomJokes(int count) async {
    List<JokeModel> jokes = [];

    for (int i = 0; i < count; i++) {
      final url = Uri.parse("$baseUrl/random");
      final resp = await http.get(url);

      if (resp.statusCode != 200) {
        throw Exception("Error al obtener los chistes de Chuck Norris");
      }

      final data = jsonDecode(resp.body);
      jokes.add(JokeModel.fromJson(data));
    }

    return jokes;
  }

  Future<List<String>> fetchCategories() async {
    final url = Uri.parse("$baseUrl/categories");
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      throw Exception("Error al obtener las categorías");
    }

    final List<dynamic> data = jsonDecode(resp.body);
    return data.map((e) => e.toString()).toList();
  }

  Future<List<JokeModel>> searchJokes(String query) async {
    final url = Uri.parse("$baseUrl/search?query=$query");
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      throw Exception("Error al buscar chistes");
    }

    final data = jsonDecode(resp.body);
    final List results = data["result"];
    return results.map((e) => JokeModel.fromJson(e)).toList();
  }
}
