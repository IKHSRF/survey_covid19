import 'package:flutter/material.dart';
import 'package:survey_covid19/models/question.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  List<Question> questions = [
    Question("Saya pergi ke luar rumah", false),
    Question(
        "Saya menggunakan transportasi umum : angkot, bus, taksi, kereta api",
        false),
    Question("Saya tidak memakai masker pada saat berkumpul dengan orang lain",
        false),
    Question("Saya berjabat tangan dengan orang lain", false),
    Question(
        "Saya tidak membersihkan tangan dengan hand sanitizer / tissue basah sebelum pegang kemudi mobil / motor",
        false),
    Question(
        "Saya menyentuh benda / uang yang juga disentuh orang lain", false),
    Question(
        "Saya tidak menjaga jarak 1,5 meter dengan orang lain ketika: belanja, bekerja, belajar, ibadah",
        false),
    Question("Saya makan diluar rumah (warung / restaurant)", false),
    Question(
        "Saya tidak minum hangat & cuci tangan dengan sabun setelah tiba di tujuan",
        false),
    Question("Saya berada di wilayah kelurahan tempat pasien tertular", false),
    Question(
        "Saya tidak pasang hand sanitizer di depan pintu masuk, untuk bersihkan tangan sebelum pegang gagang (handle) pintu masuk rumah",
        false),
    Question(
        "Saya tidak mencuci tangan dengan sabun setelah tiba di rumah", false),
    Question(
        "Saya tidak menyediakan: tissue basah/antiseptic, masker, sabun antiseptic bagi keluarga di rumah",
        false),
    Question(
        "Saya tidak segera merendam baju & celana bekas pakai di luar rumah kedalam air panas / sabun",
        false),
    Question(
        "Saya tidak segera mandi keramas setelah saya sampai di rumah", false),
    Question(
        "Saya tidak mensosialisasikan check list penilaian resiko pribadi ini kepada keluarga di rumah",
        false),
    Question(
        "Saya Saya dalam sehari tidak kena cahaya matahari minimal 15 menit",
        false),
    Question("Saya tidak jalan kaki / berolahraga minimal 30 menit setiap hari",
        false),
    Question("Saya jarang minum vitamin C & E, dan kurang tidur", false),
    Question("Usia saya diatas 60 tahun", false),
    Question(
        "Saya mempunyai penyakit: jantung / diabetes / gangguan pernafasan kronik",
        false)
  ];

  //total jawaban ya 0 - 7 = resiko rendah
  //total jawabann ya 8 - 14 = resiko sedang
  //total jawaban ya 15 - 21 = resiko tinggi

  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 2.5),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 8.0,
                    left: MediaQuery.of(context).size.width / 8.0,
                    top: 20.0,
                    bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Pertanyaan #${questionIndex + 1}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 2.0,
                        left: 2.0,
                      ),
                      child: Center(
                        child: Text(
                          questions[questionIndex].pertanyaan,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Jawaban disini....",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.0,
                        left: MediaQuery.of(context).size.width / 15.0,
                        right: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        if (questionIndex == 20) {
                          Navigator.of(context).pushNamed('hasil');
                        } else {
                          if (questions[questionIndex].answer == true) {
                            setState(() {
                              questionIndex++;
                            });
                          } else {
                            setState(() {
                              questionIndex++;
                              Question.yes++;
                            });
                          }
                        }
                      },
                      child: Container(
                        height: 40.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Text(
                            "Ya",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 5.0,
                      right: MediaQuery.of(context).size.width / 15.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (questionIndex == 20) {
                          Navigator.of(context).pushNamed('hasil');
                        } else {
                          if (questions[questionIndex].answer == false) {
                            setState(() {
                              questionIndex++;
                            });
                          } else {
                            setState(() {
                              questionIndex++;
                              Question.yes++;
                            });
                          }
                        }
                      },
                      child: Container(
                        height: 40.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            "TIDAK",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
