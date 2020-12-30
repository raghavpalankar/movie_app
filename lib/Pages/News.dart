import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Pages/webviewpage.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool _loading = true;
  var news;
  Future getNewsData() async {
    String URL =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=4ffc89b83ae3417983fd19037c1de1d1";
    var response = await http.get(URL);
    var jsonData = json.decode(response.body);
    news = jsonData['articles'];
    print(news);
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
    getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [Text('Head'), Text('Lines')],
          ),
          backgroundColor: Colors.black,
        ),
        body: _loading == true
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => WebViewExample(
                            url: news[index]["url"],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Text(
                                news[index]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    news[index]['urlToImage'],
                                    height: 180,
                                  ),
                                ),
                              ),
                              Text(
                                news[index]['description'],
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }));
  }
}
