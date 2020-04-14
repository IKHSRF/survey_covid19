import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      "#DIRUMAH",
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                    child: Text(
                      "AJA",
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(130.0, 175.0, 0.0, 0.0),
                    child: Text(
                      ".",
                      style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width / 3.0),
            Padding(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Text(
                "Ayo cari tahu seberapa besar resiko anda tertular covid-19",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: MediaQuery.of(context).size.width / 6.0,
                  right: MediaQuery.of(context).size.width / 6.0,
                ),
                child: Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "CARI TAHU SEKARANG",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('login');
              },
            )
          ],
        ),
      ),
    );
  }
}
