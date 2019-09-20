import '../models/characters.dart';
import '../models/films.dart';
import '../models/planets.dart';

abstract class HomePageApi {
  Future<List<Film>> getFilms();
  Future<List<Planet>> getPlanets();
  Future<List<Character>> getCharacters();
}