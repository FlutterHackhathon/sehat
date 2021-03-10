import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(MyApp());

class Donations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Donations',
          style: TextStyle(
              color: Colors.black, fontFamily: 'CaveatBrush', fontSize: 24),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FlareActor(
                "animations/coin flip.flr",
                animation: "3D Coin Flip",
                alignment: Alignment.bottomLeft,
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Diclaimer:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                  Text(
                      "the button down below(👇) will take you to a government site where you can Donate and we have no relation with it.Have a nice day😄."),
                  FlatButton(
                    onPressed: () async {
                      if (await canLaunch("https://www.pmcares.gov.in/en/")) {
                        await launch("https://www.pmcares.gov.in/en/");
                      } else {
                        throw 'un bale to launch https://www.pmcares.gov.in/en/';
                      }
                    },
                    child: Text("Donate Now"),
                    color: Colors.green[400],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
