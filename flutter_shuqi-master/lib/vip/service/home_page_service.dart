import 'package:dio/dio.dart';
import '../models/characters.dart';
import '../models/films.dart';
import '../models/planets.dart';
import '../service/home_page_api.dart';

class HomePageService implements HomePageApi {

  // HomePageService.internal();
  final _baseUrl = 'https://swapi.co/api';

  static final HomePageService _internal = HomePageService.internal();
  factory HomePageService() => _internal;
  HomePageService.internal();

  Dio dio = Dio();

  Future<List<Film>> getFilms() async {
    print('刷新1');
    Response response = await dio.get('$_baseUrl/films');
    print(response);
    if (response.statusCode == 200) {
      var data = response.data;
      List<dynamic> filmsData = data['results'];
      List<Film> films = filmsData.map((f) => Film.fromMap(f)).toList();
      print(films);
      return films;
    } else {
      throw Exception('Filaed to get planets');
    }
  }

  Future<List<Planet>> getPlanets() async {
    Response response = await dio.get('$_baseUrl/planets');
    if (response.statusCode == 200) {
      var data = response.data;
      List<dynamic> planetsData = data['results'];
      List<Planet> planets = planetsData.map((f) => Planet.fromMap(f)).toList();
      return planets;
    } else {
      throw Exception('Filaed to get planets');
    }
  }

  Future<List<Character>> getCharacters() async {
    Response response = await dio.get('$_baseUrl/people');
      if (response.statusCode == 200) {
        var data = response.data;
        List<dynamic> charactersData = data['results'];
        List<Character> characters = charactersData.map((f) => Character.fromMap(f)).toList();
        return characters;
      } else {
        throw Exception('Filaed to get planets');
      }
  }
}