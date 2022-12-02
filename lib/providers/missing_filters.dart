import 'package:flutter/material.dart';

class MissingFilters with ChangeNotifier {
  String _specie = '';
  String _breed = '';
  String _color = '';
  String _size = '';
  String _sex = '';

  String get getSpecie => _specie;
  String get getBreed => _breed;
  String get getColor => _color;
  String get getSize => _size;
  String get getSex => _sex;

  void changeSpecie(String specie) {
    _specie = specie;
    notifyListeners();
  }

  void changeBreed(String breed) {
    _breed = breed;
    notifyListeners();
  }

  void changeColor(String color) {
    _color = color;
    notifyListeners();
  }

  void changeSize(String size) {
    _size = size;
    notifyListeners();
  }

  void changeSex(String sex) {
    _sex = sex;
    notifyListeners();
  }
}
