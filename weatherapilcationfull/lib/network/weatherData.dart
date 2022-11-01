// ignore_for_file: file_names

import 'dart:convert';

import 'package:weatherapilcationfull/requestModel/weatherModel.dart';
import 'package:http/http.dart ' as http;

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=08e4d79fff39454d83b151048223110&q=$latitude,$longitude&aqi=no");
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
