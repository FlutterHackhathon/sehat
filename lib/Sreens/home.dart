// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healthcare/API/news.dart';
import 'package:healthcare/Sreens/covid.dart';
import 'package:healthcare/Sreens/helpline.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:healthcare/widgets/news_dispaly.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:healthcare/Sreens/images.dart';
// import 'package:healthcare/Sreens/preventions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _storedImage;
  var newscontent;
  // final newsresult;
  int newsno = 0;
  List<File> images = [];

  Future<void> _imgFromCamera() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      images.add(imageFile);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetImage(images)),
    );
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
  }

  Future<void> _imgFromGallery() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) {
      return;
    }
    setState(() {
      images.add(imageFile);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetImage(images)),
    );
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    
  }

  Future<void> news() async {
    final newsresult =
        await newsapi("api key here", http.Client());
    print(newsresult);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("found ${newsresult["totalResults"]} articles"),
    ));
    setState(() {
      newscontent = newsresult["articles"];
      newsno = newsresult["totalResults"];
    });

    // print(newscontent[0]);
    return true;
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    news();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SafeArea(
        child: Scaffold(
          body: Container(
            child: SingleChildScrollView(
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
                        "Latest Covid news",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black38,
                    height: 20,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Container(
                              child: IconButton(
                                icon: Icon(MdiIcons.hospital),
                                color: Colors.pink,
                                onPressed: () async {
                                  if (await canLaunch(
                                      "https://www.ncdc.gov.in/index1.php?lang=1&level=1&sublinkid=703&lid=550")) {
                                    await launch(
                                        "https://www.ncdc.gov.in/index1.php?lang=1&level=1&sublinkid=703&lid=550");
                                  } else {
                                    throw 'un bale to launch https://www.ncdc.gov.in/index1.php?lang=1&level=1&sublinkid=703&lid=550';
                                  }
                                },
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.0, color: Colors.pink),
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: Colors.pink,
                              border:
                                  Border.all(width: 1.0, color: Colors.pink),
                            ),
                          ),
                          Text("Preventions")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.call),
                                color: Colors.pink,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => helpline()),
                                  );
                                },
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.0, color: Colors.pink),
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: Colors.pink,
                              border:
                                  Border.all(width: 1.0, color: Colors.pink),
                            ),
                          ),
                          Text("Helpline")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Container(
                              child: IconButton(
                                icon: Icon(MdiIcons.faceMask),
                                color: Colors.pink,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => covidinfo()),
                                  );
                                },
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.0, color: Colors.pink),
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: Colors.pink,
                              border:
                                  Border.all(width: 1.0, color: Colors.pink),
                            ),
                          ),
                          Text("info")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Container(
                              child: IconButton(
                                icon: Icon(MdiIcons.fileDocument),
                                color: Colors.pink,
                                onPressed: () {
                                  _showPicker(context);
                                },
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.0, color: Colors.pink),
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: Colors.pink,
                              border:
                                  Border.all(width: 1.0, color: Colors.pink),
                            ),
                          ),
                          Text("Document")
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black38,
                    height: 20,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  ListView.builder(
                      itemCount: newsno ?? 1,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        print(newscontent[index]);
                        return NewsDispaly(
                          url: newscontent[index]['url'] ?? '',
                          source: newscontent[index]['source']['name'] ?? '',
                          author: newscontent[index]['author'] ?? '',
                          title: newscontent[index]['title'] ?? '',
                          description: newscontent[index]["description"] ?? '',
                          urlToImage: newscontent[index]["urlToImage"] ?? '',
                          publishedAt: newscontent[index]["publishedAt"] ?? '',
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
