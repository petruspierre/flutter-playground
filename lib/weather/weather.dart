import 'package:flutter/material.dart';
import 'package:flutter_playground/weather/data_service.dart';
import 'package:flutter_playground/weather/models.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final _cityTextController = TextEditingController();

  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response!.iconUrl),
                    Text(
                      '${_response!.tempInfo.temperature} °C',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(_response!.weatherInfo.description)
                  ],
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter City',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _search,
                child: Text('Get Weather'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);

    print(_response);

    setState(() => _response = response);
  }
}
