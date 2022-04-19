import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:async';
import 'package:weather/globals.dart';
import 'package:http/http.dart' as http;
import 'package:clock/clock.dart';
import 'dart:ui';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  Image image2 = Image.asset('loading.gif');
  void _show() {
    final timer = Timer(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pop();
      },
    );
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext ctx) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AlertDialog(
              elevation: 10,
              title: const Text('Fetching'),
              content: image2,
              actions: [],
            ),
          );
        });
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
                            Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: 80),
                              child: image1,
                            ),

                            TextField(
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) async {
                                _show();

                                print(locController.text);
                                city = locController.text;
                                String key = '57469bdd737a35670d966f80a8d64451';
                                String url =
                                    'http://api.openweathermap.org/data/2.5/weather?';
                                String fullurl =
                                    url + "q=" + city + "&appid=" + key;
                                print('step 0');
                                Uri fullurl1 = Uri.parse(fullurl);
                                print('step 0.2');
                                var response = await http.post(fullurl1);
                                print('step 0.4');
                                var body = response.body;

                                body1 = json.decode(body);
                                print(response.body);
                                print('\n \n');

                                weath = body1['weather'][0]['main'];
                                var temp = body1['main']['temp'] - 273.15;
                                temp1 = temp.toStringAsFixed(2);
                                humd = body1['main']['humidity'];
                                aq = body1['main']['pressure'];
                                if (weath == 'Haze') {
                                  image1 = Image.asset('assets/haze.gif');
                                }
                                if (weath == 'Drizzle') {
                                  image1 = Image.asset('assets/stormy.gif');
                                }
                                if (weath == 'Rain') {
                                  image1 = Image.asset('assets/stormy.gif');
                                }
                                if (weath == 'Snow') {
                                  image1 = Image.asset('assets/snowy.gif');
                                }
                                if (weath == 'Sunny') {
                                  image1 = Image.asset('assets/sunny.gif');
                                }
                                if (weath == 'Clear') {
                                  image1 = Image.asset('assets/sunny.gif');
                                }
                                if (weath == 'Thunderstorm') {
                                  image1 = Image.asset('assets/thunder.gif');
                                }
                                if (weath == 'Clouds') {
                                  image1 = Image.asset('assets/cloudy.gif');
                                }
                                setState(() {});
                                Timer;
                                print('step3');
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
                                              '$aq',
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
                                            left: 125,
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
                                              'Pressure',
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
