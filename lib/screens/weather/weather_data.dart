// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/screens/weather/widgets/search_place.dart';
import 'package:weatherapp/utils/colors.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather data"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: () => searchForPlaces(context),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: lightColor),
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text("Search with city, zipcode,..."),
                  ],
                ),
              ),
            ),
            Center(
              child: Consumer<WeatherProvider>(
                builder: (context, provider, _) {
                  return FutureBuilder<Weather>(
                      future: provider.getWeatherData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            provider.userInput == "") {
                          return Center(
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              width: 100,
                              height: 100,
                              child: const CircularProgressIndicator(),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Text(
                              "Unable to get weather data. Try again.");
                        } else {
                          final weather = snapshot.data;

                          return Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(20),
                            color: lightColor,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Location: ${weather!.name}',
                                ),
                                Text(
                                  'Temperature: ${weather.main.temp}°K',
                                ),
                                Text(
                                  'Feels Like: ${weather.main.feels_like}°K',
                                ),
                                Text(
                                  'Condition: ${weather.weather[0].description}',
                                ),
                                Text(
                                  'Humidity: ${weather.main.humidity}%',
                                ),
                                Text(
                                  'Wind Speed: ${weather.wind.speed} m/s',
                                ),
                              ],
                            ),
                          );
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
