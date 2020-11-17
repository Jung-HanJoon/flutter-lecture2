import 'package:flutter/material.dart';
import 'package:flutter_apps_https/model/conferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_apps_https/extention_functions/extentions.dart';

class SearchDetailPage extends StatelessWidget {
  Conferences _data;

  SearchDetailPage(Conferences data) {
    this._data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${_data.name}',
            style: TextStyle(fontWeight: FontWeight.bold),
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
                    tag: _data,
                    child: Text(
                      '${_data.location}',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${_data.start}-${_data.end}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Text(
                    "Go to official Web Site",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () async {
                    if (await canLaunch('${_data.link}')) {
                      await launch('${_data.link}');
                    } else {
                      throw 'Could not launch ${_data.link}';
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
