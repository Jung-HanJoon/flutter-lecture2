import 'package:flutter/material.dart';
import 'package:flutter_apps_https/ui/http_page.dart';
import 'package:flutter_apps_https/ui/search_page.dart';
import 'package:http/http.dart' as http;
import 'ui/fisrt_page.dart';
import 'ui/second_page.dart';
import 'ui/third_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '인스타그램 클론코딩 해보기',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NaviUI(),
    );
  }
}

class NaviUI extends StatefulWidget {
  @override
  _NaviUIState createState() => _NaviUIState();
}

class _NaviUIState extends State<NaviUI> {
  int page_num = 0;
  final List<Widget> view_page = [FirstPage(), SecondPage(), ThirdPage(), SearchPage()];

  void _onTap(int index) {
    setState(() {
      page_num = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view_page[page_num],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: page_num,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), title: Text('Cafe')),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), title: Text('info')),
          BottomNavigationBarItem(
              icon: Icon(Icons.http), title: Text('info')),

        ],

        onTap: _onTap,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
