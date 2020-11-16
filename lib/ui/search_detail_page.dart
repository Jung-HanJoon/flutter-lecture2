import 'package:flutter/material.dart';
import 'package:flutter_apps_https/model/conferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchDetailPage extends StatelessWidget {
  Conferences data;

  SearchDetailPage(Conferences data) {
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Row(
            children: [
              Text(
                '${data.name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: data,
                    child: Text('${data.location}', )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${data.start}' + ' ~ ' + '${data.end}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Text(
                    "Go to official Web Site",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () async {
                    if (await canLaunch('${data.link}')) {
                      await launch('${data.link}');
                    }else{
                      throw 'Could not launch ${data.link}';
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
