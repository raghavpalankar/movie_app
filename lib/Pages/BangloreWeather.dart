import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  bool _loading = true;
  var jsonData;
  String URL =
      "http://api.weatherapi.com/v1/current.json?key=cf97ce9deeb34a6f82872511202210&q=Davangere";
  Future getWeather() async {
    var response = await http.get(URL);
    jsonData = jsonDecode(response.body);
    // print(jsonData['location']['name']);
    if (response.statusCode == 200) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Weather')),
        backgroundColor: Colors.black,
      ),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      jsonData['location']['name'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      ("Temp  ${(jsonData['current']['temp_c']).toString() + "c"}"),
                      style: TextStyle(
                        fontSize: 30,
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            jsonData['current']['condition']['text'],
                            style: TextStyle(
                              fontSize: 30,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.network(
                            "https:${jsonData['current']['condition']['icon']}",
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ("Wind  ${(jsonData['current']['wind_kph']).toString()} kph"),
                      style: TextStyle(
                        fontSize: 30,
                        height: 2,
                      ),
                    ),
                    Text(
                        ("Pressure ${(jsonData['current']['pressure_mb']).toString()} hPa"),
                        style: TextStyle(
                          fontSize: 30,
                          height: 2,
                        )),
                    Text(
                      "Humidity ${(jsonData['current']['humidity']).toString() + "%"}",
                      style: TextStyle(
                        fontSize: 30,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
