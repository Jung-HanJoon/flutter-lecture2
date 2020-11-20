import 'package:flutter/material.dart';
import 'package:flutter_apps_https/model/album.dart';
import 'package:flutter_apps_https/ui/http_page.dart';

class AsyncPage extends StatefulWidget {
  @override
  _AsyncPageState createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  var _album;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchAlbum().then((album) {
      setState(() {
        _album = album;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data.toString()));
          } else {
            return Center(child: Text('에러 발생'));
          }
        });
  }
}
