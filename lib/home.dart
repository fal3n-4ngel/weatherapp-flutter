import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:weather/globals.dart';
import 'package:http/http.dart' as http;
import 'package:clock/clock.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  Future<String> weather() async {
    String key = '57469bdd737a35670d966f80a8d64451';
    String url = 'http://api.openweathermap.org/data/2.5/weather?';
    String fullurl = url + "q=" + city + "&appid=" + key;
    Uri fullurl1 = Uri.parse(fullurl);
    var response = await http.post(fullurl1);
    var body = response.body;
    try {
      body1 = convert.jsonDecode(body);
      weath = body1['weather'][0]['main'];
      var temp = body1['main']['temp'] - 273.15;
      temp1 = temp.toStringAsFixed(2);

      humd = body1['main']['humidity'];
      setState(() {});
    } catch (e) {
      String temp1 = 'Null';
      humd = 'Null';
      weath = 'Null';
    }

    return body;
  }

  TextEditingController locController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //
        //
        //
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
            child: Column(children: [
              Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width),
                  height: (MediaQuery.of(context).size.height) - 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 40,
                      left: 10,
                      right: 10,
                      child: Container(
                          alignment: Alignment.center,
                          width: 327,
                          height: MediaQuery.of(context).size.height - 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(253, 252, 252, 1),
                          ),
                          child: Stack(children: <Widget>[
                            // Search Location

                            TextField(
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) async {
                                try {
                                  city = locController.text;
                                  weather();
                                  String key =
                                      '57469bdd737a35670d966f80a8d64451';
                                  String url =
                                      'http://api.openweathermap.org/data/2.5/weather?';
                                  String fullurl =
                                      url + "q=" + city + "&appid=" + key;
                                  Uri fullurl1 = Uri.parse(fullurl);
                                  var response = await http.post(fullurl1);
                                  var body = response.body;

                                  weath = body1['weather'][0]['main'];
                                  var temp = body1['main']['temp'] - 273.15;
                                  temp1 = temp.toStringAsFixed(2);
                                  humd = body1['main']['humidity'];
                                  setState(() {});
                                  print(temp1);
                                  print('hsvjvs');
                                } catch (e) {
                                  String temp1 = 'Null1';
                                  humd = 'Null';
                                  weath = 'Null';
                                  setState(() {});
                                }
                                if (weath == 'Haze') {
                                  image1 = Image.asset('assets/sunny.png');
                                  setState(() {});
                                } else if (weath == 'Clouds') {
                                  print('fff');
                                  image1 = Image.asset('assets/sunny.png');
                                  setState(() {});
                                } else if (weath == 'rainy') {
                                  image1 = Image.asset('assets/rainy.png');
                                  setState(() {});
                                } else if (weath == 'clear') {
                                  image1 = Image.asset('assets/clear.png');
                                  setState(() {});
                                } else
                                  () {
                                    String icon_url =
                                        "http://openweathermap.org/img/w/" +
                                            body1['weather'][0]['icon'] +
                                            '.png';
                                    image1 = Image.asset('assets/clear.png');
                                    setState(() {});
                                  };
                                setState(() {});
                              },
                              controller: locController,
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(64, 240, 240, 240),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide.none,
                                ),
                                labelText: 'Search Location',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 129, 126, 126),
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(top: 40),
                              child: image1,
                            ),

                            // Main Body
                            Container(
                                alignment: Alignment.center,
                                width: 500,
                                height:
                                    MediaQuery.of(context).size.height - 150,
                                child: Stack(children: <Widget>[
                                  // Location
                                  Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(top: 120),
                                      child: Text(
                                        '$city',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(44, 44, 44, 1),
                                            fontFamily: 'Comfortaa',
                                            fontSize: 50,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      )),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(top: 320),
                                    child: Text(
                                      '$temp1 \u2103',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(44, 44, 44, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 70,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                  // Data
                                  Container(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              280,
                                          left: 0,
                                          right: 0),
                                      width: 500,
                                      height:
                                          MediaQuery.of(context).size.height -
                                              150,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                                width: 327,
                                                height: 59,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(11),
                                                    topRight:
                                                        Radius.circular(11),
                                                    bottomLeft:
                                                        Radius.circular(11),
                                                    bottomRight:
                                                        Radius.circular(11),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      252, 252, 252, 1),
                                                ))),
                                        Positioned(
                                            top: 6,
                                            left: 36,
                                            child: Text(
                                              'Weather',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      196, 196, 196, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 26,
                                            left: 38,
                                            child: Text(
                                              '$weath',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      154, 154, 154, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 26,
                                            left: 124,
                                            child: Text(
                                              '$temp1 \u2103',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      154, 154, 154, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 26,
                                            left: 203,
                                            child: Text(
                                              '$humd',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      154, 154, 154, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 26,
                                            left: 289,
                                            child: Text(
                                              '22',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      154, 154, 154, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 6,
                                            left: 131,
                                            child: Text(
                                              'Temp',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      196, 196, 196, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 6,
                                            left: 198,
                                            child: Text(
                                              'Humidity',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      196, 196, 196, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 6,
                                            left: 289,
                                            child: Text(
                                              'AQ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      196, 196, 196, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                      ])),
                                  // Data End...
                                ]))
                          ])),
                    ),
                  ])),
            ])));
  }
}
