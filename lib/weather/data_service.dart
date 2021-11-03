import 'dart:convert';

import 'package:flutter_playground/weather/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParams = {'q': city, 'appid': '', 'units': 'metric'};

    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParams);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);

    return WeatherResponse.fromJson(json);
  }
}
