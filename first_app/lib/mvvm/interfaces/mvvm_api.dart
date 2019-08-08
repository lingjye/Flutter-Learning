import 'package:first_app/mvvm/models/character.dart';
import 'package:first_app/mvvm/models/film.dart';
import 'package:first_app/mvvm/models/planet.dart';

abstract class MVVMApi {
  Future<List<Film>> getFilms();
  Future<List<Character>> getCharacters();
  Future<List<Planet>> getPlanets();
}