import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String key = '57469bdd737a35670d966f80a8d64451';
String url = 'http://api.openweathermap.org/data/2.5/weather?';
String city = 'delhi';
String fullurl = url + "q=" + city + "&appid=" + key;
Uri fullurl1 = Uri.parse(fullurl);
Future<String> weather() async {
  var response = await http.get(fullurl1);
  String body = response.body;
  var body1 = body;
  print(body1);
  return body1;
}
