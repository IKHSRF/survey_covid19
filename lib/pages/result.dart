import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_covid19/models/question.dart';
import 'package:survey_covid19/validations/validation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String resiko;
  String pendapat;

  void _addData() {
    Firestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference = Firestore.instance.collection('hasil');
      await reference.add({
        "nama": Data.nama,
        "kota": Data.kota,
        "resiko": resiko,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Question.yes <= 7) {
      resiko = "Rendah";
      pendapat = "Kamu menjalankan social distancing dengan baik";
    } else if (Question.yes <= 14) {
      resiko = "Sedang";
      pendapat =
          "Hati - Hati Ya, kamu harus lebih memperhatikan lingkungan sekitar mu";
    } else if (Question.yes > 14) {
      resiko = "Tinggi";
      pendapat = "Segera perikasalah ke Dokter";
    }

    //C:\Program Files (x86)\Nox\bin
    //nox_adb.exe connect 127.0.0.1:62001

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 5.0,
                  left: MediaQuery.of(context).size.width / 10.0,
                  right: MediaQuery.of(context).size.width / 10.0),
              child: Container(
                child: Text(
                  "Resiko: $resiko",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 10.0,
                  left: MediaQuery.of(context).size.width / 10.0,
                  right: MediaQuery.of(context).size.width / 10.0),
              child: Container(
                child: Text(
                  "${Data.nama}",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10.0,
                    right: MediaQuery.of(context).size.width / 10.0),
                child: Text(
                  "$pendapat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 40.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "IKUTI SURVEY LAGI",
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
                Data.nama = '';
                Question.yes = 0;
              },
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 40.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child: Text(
                      "SIMPAN DATA & KELUAR",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                _addData();
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      ),
    );
  }
}
