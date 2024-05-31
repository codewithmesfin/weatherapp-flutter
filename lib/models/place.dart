class Place {
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String state;

  const Place({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json['name'] as String,
        lat: json['lat'] as double,
        lon: json['lon'] as double,
        country: json['country'] as String,
        state: json['state'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'lat': lat,
        'lon': lon,
        'country': country,
        'state': state,
      };
}
