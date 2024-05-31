// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/place.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/utils/constants.dart';

Future<List<Place>> getPlaces(String userInput) async {
  var url = '$baseUrl/geo/1.0/direct?q=$userInput&limit=10&appid=$weatherApi';

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  var request = http.Request('GET', Uri.parse(url));
  request.headers.addAll(headers);

  try {
    http.StreamedResponse response = await request.send();

    if (response.statusCode <= 200 || response.statusCode <= 300) {
      final responseBody = await response.stream.bytesToString();
      final jsonData = json.decode(responseBody);

      final List<dynamic> placesData = jsonData as List<dynamic>;

      final places =
          List<Place>.from(placesData.map((json) => Place.fromJson(json)));

      return places;
    }
    throw Exception('Request failed with status: ${response.statusCode}');
  } catch (e) {
    throw Exception('An error occurred during the request: $e');
  }
}

Future<Weather> getWeatherData(double latitude, double longitude) async {
  var url =
      '$baseUrl/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$weatherApi';

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  var request = http.Request('GET', Uri.parse(url));
  request.headers.addAll(headers);

  try {
    http.StreamedResponse response = await request.send();

    if (response.statusCode <= 200 || response.statusCode <= 300) {
      final responseBody = await response.stream.bytesToString();
      final jsonData = json.decode(responseBody);
      Map<String, dynamic> weatherMap = jsonData;
      Weather weather = Weather.fromJson(weatherMap);

      // Weather weatherData = Weather.fromJson(jsonData);

      return weather;
    }
    throw Exception('Request failed with status: ${response.statusCode}');
  } catch (e) {
    throw Exception('An error occurred during the request: $e');
  }
}
