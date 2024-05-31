// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:weatherapp/screens/auth/signin.dart';
import 'package:weatherapp/screens/page_not_found.dart';
import 'package:weatherapp/screens/weather/weather_data.dart';
import 'package:weatherapp/utils/constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var arg = settings.arguments;
  switch (settings.name) {
    case weather:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => const WeatherData());
    case signin:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => const Signin());

    default:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => const NotFound());
  }
}
