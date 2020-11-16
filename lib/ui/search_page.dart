import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_apps_https/model/conferences.dart';
import 'package:flutter_apps_https/ui/search_detail_page.dart';
import 'package:http/http.dart' as http;

Future<List<Conferences>> fetchConferences() async{
  //await Future가 종료되는 것을 기다린다, async 키워드가 붙어있는 메서드 안에서만 사용 가능
  final http.Response response = await http.get('https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json');

  //200 = ok
  if(response.statusCode==200){
    //jsonDecod로 json 형태의string을 Map 형태로 변환
    final Iterable json = jsonDecode(response.body);
    return json.map((e)=>Conferences.fromJson(e)).toList();
    //변환된 Map 형태의json을 Albm 객체로 변환

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
  List<Conferences> conferList;
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
        title: Text('Conferences', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),), backgroundColor: Colors.white,
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
                children: conferList
                    .map((e) => ListTile(title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${e.name}',),
                        Text('${e.location}',),
                      ],
                    ), onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchDetailPage(e)),
                        );
                },))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }


}
