import 'dart:convert';

import 'package:first_app/mvvm/interfaces/mvvm_api.dart';
import 'package:first_app/mvvm/models/character.dart';
import 'package:first_app/mvvm/models/film.dart';
import 'package:first_app/mvvm/models/planet.dart';
import 'package:http/http.dart' as http;

class ApiService implements MVVMApi {
  final _baseUrl = 'https://swapi.co/api';
  http.Client _clinet = http.Client();
  set client(http.Client value) => _clinet = value;

  static final ApiService _internal = ApiService.internal();
  factory ApiService() => _internal;
  ApiService.internal();

  Future<List<Film>> getFilms() async{
    var response = await _clinet.get('$_baseUrl/films');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<dynamic> filmsData = data['results'];
      List<Film> films = filmsData.map((f) => Film.fromMap(f)).toList();
      return films;
    } else {
      throw Exception('Failed to get Films');
    }
  }

  Future<List<Character>> getCharacters() async{
    var response = await _clinet.get('$_baseUrl/people');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> characterData = data['results'];
      List<Character> characters = characterData.map((f) => Character.fromMap(f)).toList();
      return characters;
    } else {
      throw Exception('Filaed to get planets');
    }
  }

  Future<List<Planet>> getPlanets() async {
    var response = await _clinet.get('$_baseUrl/planets');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> planetsData = data['results'];
      List<Planet> planets = planetsData.map((f) => Planet.fromMap(f)).toList();
      return planets;
    } else {
      throw Exception('Filaed to get planets');
    }
  }
}