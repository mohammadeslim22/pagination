import 'package:database_create_error/joinobject.dart';
import 'package:database_create_error/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BackendService.dart';
import 'DBhelper.dart';
import 'notes.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;

  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState();
  }
}

class NoteDetailState extends State<NoteDetail> {
  DBHelper helper;

  List<JoinObject> joinObjectList;
  @override
  void initState() {
    super.initState();
    helper = DBHelper();
    // if (joinObjectList == null) {
    //    generateData();
    // }
  }

  void updatedata() async {
    Future<List<JoinObject>> noteListFuture = helper.getJoinData();
    noteListFuture.then((joinObjectListList) {
      setState(() {
        this.joinObjectList = joinObjectListList;
      });
    });
  }

  void generateData() {
    for (int i = 0; i < 20000; i++) {
      Note n = new Note(i, i, "desc");
      User u = new User(i, "_title", "name", "0567505838");
      helper.addNote(n);
      print("^^^^^^^^^^^^^^^^^^^^^^^addddd^^^^^^^^^^^^^^^");
      helper.adduser(u);
    }
  }

  @override
  Widget build(BuildContext context) {
   //  generateData();
    return PagewiseListView(
        pageSize: 20,
        itemBuilder: this._itemBuilder,
        pageFuture: (pageIndex) =>
            BackendService.getPosts(pageIndex * 20, (pageIndex * 20) + 20));
  }

  Widget listItem(JoinObject jo) {
    return Container(
        child: Column(
      children: <Widget>[
        Text(
          "user id:  " + jo.userId.toString(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 30,
          height: 30,
        ),
        Text(
          "name:  " + jo.name.toString(),
          style: TextStyle(fontSize: 18),
        ),
        // Text(
        //   "title:  " + jo.title.toString(),
        //   style: TextStyle(fontSize: 18),
        // ),
      ],
    ));
  }

  Widget _itemBuilder(context, JoinObject entry, _) {
    return Column(
      children: <Widget>[listItem(entry), Divider()],
    );
  }
}
