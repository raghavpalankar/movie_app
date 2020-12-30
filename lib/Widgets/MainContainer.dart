import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final String description;
  final String cases;
  const MainContainer({
    Key key,
    @required this.globalData,
    this.description,
    this.cases,
  }) : super(key: key);

  final Map globalData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Global ',
              style: TextStyle(
                color: Color(0xFF7D7D7D),
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFD1D1D1),
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            globalData[cases].toString().replaceAllMapped(
                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => '${m[1]},'),
            style: TextStyle(
              color: Color(0xFF7D7D7D),
              fontSize: 20,
            ),
          ),
        ],
      ),
      color: Color(0xFF1A1C1F),
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.all(35),
      height: 170,
      width: 300,
    );
  }
}
