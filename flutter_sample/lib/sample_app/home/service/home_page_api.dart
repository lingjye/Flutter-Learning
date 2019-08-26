import 'package:flutter_sample/sample_app/home/models/characters.dart';
import 'package:flutter_sample/sample_app/home/models/films.dart';
import 'package:flutter_sample/sample_app/home/models/planets.dart';

abstract class HomePageApi {
  Future<List<Film>> getFilms();
  Future<List<Planet>> getPlanets();
  Future<List<Character>> getCharacters();
}