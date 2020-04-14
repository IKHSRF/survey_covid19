import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_covid19/validations/validation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();

  final snackbarKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: snackbarKey,
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
                      "Hello",
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                    child: Text(
                      "There",
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                    child: Text(
                      ".",
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: nama,
                    decoration: InputDecoration(
                      labelText: "NAMA LENGKAP",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[a-z A-Z]"))
                    ],
                    maxLength: 30,
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: alamat,
                    decoration: InputDecoration(
                      labelText: "KOTA TEMPAT TINGGAL",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[a-z A-Z]"))
                    ],
                    maxLength: 30,
                  ),
                  SizedBox(height: 50.0),
                  GestureDetector(
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          "MULAI SURVEY",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      var snackbar;
                      if (nama.text.trim().isEmpty &&
                              alamat.text.trim().isEmpty ||
                          nama.text == "" && alamat.text == "" ||
                          nama.text == " " && alamat.text == " ") {
                        snackbar = SnackBar(
                          content: Text("Nama dan kota harus diisi"),
                        );
                      } else if (nama.text.trim().length < 5 &&
                          alamat.text.trim().length < 5) {
                        snackbar = SnackBar(
                          content:
                              Text("Isikan nama dan kota anda dengan benar"),
                        );
                      } else if (alamat.text.trim().length < 5) {
                        snackbar = SnackBar(
                          content: Text("Isikan kota anda dengan benar"),
                        );
                      } else if (nama.text.trim().length < 5) {
                        snackbar = SnackBar(
                          content: Text("Isikan nama anda dengan benar"),
                        );
                      } else if (nama.text.trim().isEmpty ||
                          nama.text == "" ||
                          nama.text == " ") {
                        snackbar = SnackBar(
                          content: Text("Nama harus diisi"),
                        );
                      } else if (alamat.text.trim().isEmpty ||
                          alamat.text == "" ||
                          alamat.text == " ") {
                        snackbar = SnackBar(
                          content: Text("Kota harus diisi"),
                        );
                      } else {
                        Data.nama = nama.text.trim();
                        Data.kota = alamat.text.trim();
                        Navigator.of(context).pushReplacementNamed('survey');
                      }
                      snackbarKey.currentState.showSnackBar(snackbar);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
