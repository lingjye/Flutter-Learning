import '../models/characters.dart';
import '../models/films.dart';
import '../models/planets.dart';
import '../service/home_page_service.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeViewModel extends Model {
  bool isDarkTheme = false;
  resetDartTheme() {
    isDarkTheme = !isDarkTheme;
  }

  Future<List<Film>> _films;
  Future<List<Film>> get films => _films;
  set films(Future<List<Film>> value) {
    _films = value;
    notifyListeners();
  }

  Future<List<Planet>> _planets;
  Future<List<Planet>> get planets => _planets;
  set planets(Future<List<Planet>> value) {
    _planets = value;
    notifyListeners();
  }

  Future<List<Character>> _characters;
  Future<List<Character>> get characters => _characters;
  set characters(Future<List<Character>> value) {
    _characters = value;
    notifyListeners();
  }

  final HomePageService service = HomePageService();
  // 主程序调用
  Future<bool> setFilms() async {
    films = service.getFilms();
    return films != null;
  }

  Future<bool> setPlanets() async {
    planets = service.getPlanets();
    return planets != null;
  }

  Future<bool> setCharacters() async {
    characters = service.getCharacters();
    return characters != null;
  }

}