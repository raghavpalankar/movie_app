import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/covid.dart';

class covidList {
  List<CovidModel> allCovidData = [];

  Future<void> getCovidData() async {
    String URL = 'https://coronavirus-19-api.herokuapp.com/countries';
    var response = await http.get(URL);
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      jsonData.forEach((element) {
        CovidModel covidModel = CovidModel(
            country: element["country"],
            cases: element["cases"],
            deaths: element["deaths"],
            todayCases: element["todayCases"],
            recovered: element["recovered"],
            active: element["active"],
            critical: element["critical"]);
        allCovidData.add(covidModel);
      });
    }
  }
}
