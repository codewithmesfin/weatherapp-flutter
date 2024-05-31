// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:weatherapp/models/place.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/services/api.dart' as apiService;

class WeatherProvider with ChangeNotifier {
  late String _userInput = "";
  String get userInput => _userInput;

  late Place _place =
      const Place(name: "", lat: 0.0, lon: 0.0, country: "", state: "");

  Place get place => _place;

//Set Search input value
  void setUserInput(String value) {
    _userInput = value;
    notifyListeners();
  }

  void setPlace(Place value) {
    _place = value;
    notifyListeners();
  }

  Future<List<Place>> getLatitudeAndLongitudes() async {
    try {
      final result = await apiService.getPlaces(_userInput);
      return result;
    } catch (e) {
      throw Exception('An error occurred during the request: $e');
    }
  }

  Future<Weather> getWeatherData() async {
    try {
      final result = await apiService.getWeatherData(_place.lat, place.lon);
      return result;
    } catch (e) {
      throw Exception('An error occurred during the request: $e');
    }
  }
}
