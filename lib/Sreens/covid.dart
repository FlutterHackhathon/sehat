// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/API/cases.dart';
import 'package:healthcare/widgets/cases.dart';
import 'package:http/http.dart' as http;
import 'package:flare_flutter/flare_actor.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class GradesData {
  final String gradeSymbol;
  final int numberOfStudents;

  GradesData(this.gradeSymbol, this.numberOfStudents);
}

class covidinfo extends StatefulWidget {
  @override
  _covidinfoState createState() => _covidinfoState();
}

class _covidinfoState extends State<covidinfo> {
  int touchedIndex;
  var response = '';
  int totalcases = 0;
  int totaldeaths = 0;
  int totalrecovered = 0;
  int todaycases = 0;
  int todaydeathes = 0;
  int todayrecovered = 0;

  void covidinfo() async {
    final String country = 'india';

    final responseCountry = await countryCovidInfo(country, http.Client());
    // response = responseCountry;
    if (this.mounted) {
      setState(() {
        todaycases = responseCountry["todayCases"];
        todaydeathes = responseCountry["todayDeaths"];
        todayrecovered = responseCountry["todayRecovered"];
        totalcases = responseCountry["cases"];
        totaldeaths = responseCountry["deaths"];
        totalrecovered = responseCountry["recovered"];
      });
    }

    print(responseCountry);
  }

  @override
  void initState() {
    covidinfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FlareActor(
                "animations/covid.flr",
                animation: "anotando",
                alignment: Alignment.bottomLeft,
              ),
            ),
            Container(
              // color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "Sehat",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontFamily: "CaveatBrush"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "Latest Covid Info",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.white),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              case_box(
                                top: 0xff719CFF,
                                mid: 0xff5488FF,
                                bottom: 0xff3B77FF,
                                col: Colors.blue,
                                child: Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Today Cases\n${todaycases ?? ''}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              case_box(
                                top: 0xffF31D66,
                                mid: 0xffFC4684,
                                bottom: 0xffFF71A1,
                                col: Colors.pink,
                                child: Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Today Deaths\n$todaydeathes",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              case_box(
                                top: 0xff71FF7A,
                                mid: 0xff29FF7E,
                                bottom: 0xff1DF373,
                                col: Color(0xff1DF373),
                                child: Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Today Recovered\n$todayrecovered",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            color: Colors.black38,
                            height: 20,
                            thickness: 1,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Center(child: Text("Toatal Cases")),
                                  Text("Toatal Deaths"),
                                  Text("Toatal Recovered"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("$totalcases"),
                                  Text("$totaldeaths"),
                                  Text("$totalrecovered"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 0xff719CFF
// 0xff5488FF
// 0xff3B77FF
// 0xff71FF7A
// 0xff29FF7E
// 0xff1DF373
