import 'package:flutter_dotenv/flutter_dotenv.dart';

const String signin = "/";
const String weather = "/weather";

String? baseUrl = dotenv.env['BASE_URL'];
String? weatherApi = dotenv.env['WEATHER_APP_ID'];
