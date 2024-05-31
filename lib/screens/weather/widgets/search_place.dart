import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/place.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/utils/colors.dart';
import 'package:weatherapp/widgets/search_field.dart';

void searchForPlaces(context) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    backgroundColor: whiteColor,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: whiteColor,
        ),
        width: double.infinity,
        child: Consumer<WeatherProvider>(
          builder: (context, provider, _) {
            return ListView(
              children: [
                SearchField(
                  onChange: (userInput) => provider.setUserInput(userInput),
                  prefix: const Icon(Icons.search),
                  placeholder: "Search with a city, zipcode",
                ),
                FutureBuilder<List<Place>>(
                    future: provider.getLatitudeAndLongitudes(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting &&
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
                            "Unable to search places. Try again.");
                      } else {
                        final places = snapshot.data ?? [];

                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: places.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(color: lightColor),
                          itemBuilder: (BuildContext context, int index) {
                            final place = places[index];
                            return ListTile(
                              onTap: () {
                                provider.setPlace(place);
                                Navigator.pop(context);
                              },
                              title: Text("${place.name}, ${place.state}"),
                              trailing: const Icon(Icons.chevron_right),
                            );
                          },
                        );
                      }
                    }),
              ],
            );
          },
        ),
      );
    },
  );
}
