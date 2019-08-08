import 'package:first_app/mvvm/interfaces/mvvm_api.dart';
import 'package:first_app/mvvm/models/character.dart';
import 'package:first_app/mvvm/models/film.dart';
import 'package:first_app/mvvm/models/planet.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MainPageViewModel extends Model {
  Future<List<Film>> _films;
  Future<List<Film>> get films => _films;
  set films(Future<List<Film>> value) {
    _films = value;
    notifyListeners();
  }

  Future<List<Character>> _characters;
  Future<List<Character>> get characters => _characters;
  set characters(Future<List<Character>> value) {
    _characters = value;
    notifyListeners();
  }

  Future<List<Planet>> _plantes;
  Future<List<Planet>> get planets => _plantes;
  set planets(Future<List<Planet>> value) {
    _plantes = value;
    notifyListeners();
  }

  final MVVMApi apiService;
  MainPageViewModel({
    @required
    this.apiService
  });

  // 主程序调用的函数入口
  Future<bool> setFilms() async {
    films = apiService.getFilms();
    return films != null;
  }

  Future<bool> setCharacters() async {
    characters = apiService.getCharacters();
    return characters != null;
  }

  Future<bool> setPlanets() async {
    planets = apiService.getPlanets();
    return planets != null;
  }
}