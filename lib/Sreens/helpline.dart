import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class helpline extends StatelessWidget {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<String> _items = [
    "Jammu",
    "Jharkhand",
    "Karnataka",
    "Kashmir",
    "Kerala",
    "Ladakh",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    'Tamil Nadu',
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Benga"
  ];
  List<String> _no = [
    "01912520982",
    "104",
    "104",
    "01942440283",
    "0471-2552056",
    '01982256462',
    '104',
    '104',
    '02026127394',
    "3852411668",
    '108',
    '102',
    '7005539653',
    '9439994859',
    '104',
    '104',
    '01412225624',
    '104',
    '044-29510500',
    '104',
    '0381-2315879',
    '104',
    '18001805145',
    '1800313444222'
  ];

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Helpline',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              'Select State',
              style: TextStyle(fontFamily: "CaveatBrush", fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return ListTile(
                  onTap: () async {
                    if (await canLaunch("tel:${_no[index]}")) {
                      await launch("tel:${_no[index]}");
                    } else {
                      throw 'Could not launch ${_no[index]}';
                    }
                  },
                  title: Text(_items[index]),
                  subtitle: Text(_no[index]),
                  trailing: Icon(
                    Icons.call,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
