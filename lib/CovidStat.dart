import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Pages/AllCountries.dart';
import 'package:movie_app/Pages/BangloreWeather.dart';
import 'package:movie_app/Pages/News.dart';
import 'package:movie_app/Widgets/MainContainer.dart';
import 'dart:convert';
import 'main.dart';

class CovidStat extends StatefulWidget {
  @override
  _CovidStatState createState() => _CovidStatState();
}

class _CovidStatState extends State<CovidStat> {
  Map globalData;
  Future getCoviddata() async {
    http.Response response;
    response = await http.get('https://coronavirus-19-api.herokuapp.com/all');
    if (response.statusCode == 200) {
      setState(() {
        globalData = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    getCoviddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.deccanherald.com/sites/dh/files/styles/article_detail/public/article_images/2020/05/19/CDC%20coronavirus-757328094-1588240810.jpg?itok=zaqB_vWa"),
                  ),
                ),
              ),
              ListTile(
                title: Text("All Countries"),
                leading: Icon(Icons.coronavirus),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => AllCoutries(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Weather"),
                leading: Icon(Icons.add_location),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Weather(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("News"),
                leading: Icon(Icons.article_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => News(),
                      ));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text("COVID Statistics")),
        ),
        body: globalData == null
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    MainContainer(
                      globalData: globalData,
                      description: "Coronavirus Cases",
                      cases: "cases",
                    ),
                    MainContainer(
                      globalData: globalData,
                      description: "Deaths",
                      cases: "deaths",
                    ),
                    MainContainer(
                      globalData: globalData,
                      description: "Recovered",
                      cases: "recovered",
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
