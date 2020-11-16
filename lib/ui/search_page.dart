import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_apps_https/model/conferences.dart';
import 'package:flutter_apps_https/ui/search_detail_page.dart';
import 'package:http/http.dart' as http;

Future<List<Conferences>> fetchConferences() async{
  final http.Response response = await http.get('https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json');
  if(response.statusCode==200){
    final Iterable json = jsonDecode(response.body);
    return json.map((e)=>Conferences.fromJson(e)).toList();
  }else{
    //에러가 나면 예외를 발생시키고 종료
    throw Exception('Failed to load Json');//
  }
}



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // final _items = List.generate(100, (index) => '$index');
  List<Conferences> conferList=[];
  @override
  void initState() {
    getjson();
  }

  Future getjson() async {
    List<Conferences> conferlist = await fetchConferences();
    setState(() {
      conferList = conferlist;
    });
  }
  var _query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conferences', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  _query = text;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '검색어'),
            ),
            Expanded(
              child: ListView(

                children: conferList.where((e) => e.name.toLowerCase().contains(_query), )
                    .map((e) => ListTile(title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${e.name}',),
                        Hero(tag: e,
                            child: Text('${e.location}',)),
                      ],
                    ), onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchDetailPage(e)),
                        );
                },)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }


}
