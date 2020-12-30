import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Helper/covidHelper.dart';
import 'package:movie_app/Model/covid.dart';

class AllCoutries extends StatefulWidget {
  @override
  _AllCoutriesState createState() => _AllCoutriesState();
}

class _AllCoutriesState extends State<AllCoutries> {
  bool _loading = true;
  List<CovidModel> coronavirus = new List<CovidModel>();

  getData() async {
    covidList covidlistclass = covidList();
    await covidlistclass.getCovidData();
    coronavirus = covidlistclass.allCovidData;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: _loading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: coronavirus.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) => Container(
                          height: 300,
                          color: Colors.transparent,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cases : ${coronavirus[index].cases.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold,
                                      height: 4),
                                ),
                                Text(
                                  "Deaths : ${coronavirus[index].deaths.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                  ),
                                ),
                                Text(
                                  "Today's Cases : ${coronavirus[index].todayCases.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5),
                                ),
                                Text(
                                  "Recovered : ${coronavirus[index].recovered.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5),
                                ),
                                Text(
                                  "Active : ${coronavirus[index].active.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    height: 3,
                                  ),
                                ),
                                Text(
                                  "Critical : ${coronavirus[index].critical.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    child: Card(
                      color: Colors.grey[300],
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            coronavirus[index].country,
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            "Cases : ${coronavirus[index].cases.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red[900],
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
