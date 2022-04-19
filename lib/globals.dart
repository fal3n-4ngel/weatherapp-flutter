import 'package:clock/clock.dart';
import 'package:flutter/material.dart';

Map body1 = {
  "coord": {"lon": 77.2167, "lat": 28.6667},
  "weather": [
    {"id": 721, "main": "Haze", "description": "haze", "icon": "50d"}
  ],
  "base": "stations",
  "main": {
    "temp": 308.2,
    "feels_like": 306.8,
    "temp_min": 308.2,
    "temp_max": 308.2,
    "pressure": 1006,
    "humidity": 24
  },
  "visibility": 4000,
  "wind": {"speed": 5.14, "deg": 310},
  "clouds": {"all": 20},
  "dt": 1647860931,
  "sys": {
    "type": 1,
    "id": 9165,
    "country": "IN",
    "sunrise": 1647824060,
    "sunset": 1647867748
  },
  "timezone": 19800,
  "id": 1273294,
  "name": "Delhi",
  "cod": 200
};
String city1 = 'Weather';
String city = 'Weather';
var temp1;
var humd;
var weath;
var aq;
var value = 0.0;
Image image1 = Image.asset('assets/weather.gif');
