import 'package:flutter/material.dart';
import 'package:flutter_playground/network_request/network_request.dart';
import 'package:flutter_playground/weather/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Weather();
  }
}
