import 'package:sqflite/sqflite.dart';

import 'DBhelper.dart';
import 'show_page.dart';
import 'user.dart';
import 'package:flutter/material.dart';
import 'JoinObject.dart';

import 'notes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  DBHelper databaseHelper = DBHelper();
  List<JoinObject> joinObjectList;

  void generateData(){
    for(int i = 0 ; i < 100000; i++){
Note n = new Note(i,i,"desc");
User u = new User(i,"_title", "name","0567505838");
    databaseHelper.addNote(n);
    print("what the fuck ");
    databaseHelper.adduser(u);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget myAppBar() {
      return AppBar(
        title: TextFormField(
            onChanged: (text) {
              print("First text field: $text");
            },
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a search term'),
            style: Theme.of(context).textTheme.headline),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () async {},
        ),
      );
    }

    return Scaffold(
      appBar: myAppBar(),
      body: NoteDetail("title"),
    );
  }
}
