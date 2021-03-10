import 'dart:ui';
// import 'package:newsapi/newsapi.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDispaly extends StatelessWidget {
  final String source;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String url;

  const NewsDispaly(
      {Key key,
      this.source,
      this.author,
      this.title,
      this.description,
      this.urlToImage,
      this.publishedAt,
      this.url,
      this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: InkWell(
          onTap: () async {
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw url;
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: SizedBox(
                    child: Text("on $source by $author",
                        style: TextStyle(fontSize: 12)),
                    width: double.infinity),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: SizedBox(
                    child: Text(publishedAt, style: TextStyle(fontSize: 10)),
                    width: double.infinity),
              ),
              const Divider(
                color: Colors.black38,
                height: 20,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              Container(
                child: Image.network(urlToImage),
              ),
              const Divider(
                color: Colors.black38,
                height: 20,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8),
                child: SizedBox(
                    child: Text(title, style: TextStyle(fontSize: 20)),
                    width: double.infinity),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: SizedBox(
                    child: Text(description, style: TextStyle(fontSize: 14)),
                    width: double.infinity),
              ),
              const Divider(
                color: Colors.black38,
                height: 20,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
