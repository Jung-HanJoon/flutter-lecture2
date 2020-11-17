import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  String whattodo = "";
  List<ListTile> todolist=[];


  void _addToDo() {
    bool checked = false;
    IconData iconData = Icons.star_border;
    setState(() {
      todolist.add(ListTile(
        title: Row(
          children: [
            Checkbox(value: checked, onChanged: null),
            Column(
              children: [
                Text(whattodo),
                Text(DateFormat.yMMMMd('en_US').format(DateTime.now()).toString()),
              ],
            ),
            IconButton(
              icon: Icon(iconData),
              onPressed: () {
                setState(() {
                  if(iconData==Icons.star_border){
                    iconData=Icons.star;
                  }else{
                    iconData=Icons.star_border;
                  }
                });
              },
            ),
          ],
        ),
      ));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context)),
            Text('Inbox'),
            TextButton(
              onPressed: () {},
              child: Text('Edit'),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _addToDo,
              ),
              Container(
                width: 150,
                height: 40,
                child: TextField(

                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add a to-do...'),
                  onChanged: (text) {
                    setState(() {
                      whattodo = text;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.star_border_outlined),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: todolist,
            ),
          ),
        ],
      ),
    );
  }
}
