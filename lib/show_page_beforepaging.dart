import 'package:database_create_error/joinobject.dart';
import 'package:database_create_error/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DBhelper.dart';
import 'notes.dart';

class NoteDetail_beforepaging extends StatefulWidget {
  final String appBarTitle;

  NoteDetail_beforepaging(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState();
  }
}

class NoteDetailState extends State<NoteDetail_beforepaging> {
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
      helper.adduser(u);
    }
  }

  @override
  Widget build(BuildContext context) {
  // generateData();
    updatedata();

    return WillPopScope(
      onWillPop: () {
        print("bst");
        print(joinObjectList[1].name);
        return;
      },
      child: (joinObjectList.length>9432)?
           ListView.builder(
              itemCount: joinObjectList == null ? 0 : joinObjectList.length,
              itemBuilder: (context, index) {
                return listItem(joinObjectList[index]);
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget listItem(JoinObject jo) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "user id:  " + jo.userId.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "name:  " + jo.name.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 30,
            ),
            // Text(
            //   "title:  " + jo.title.toString(),
            //   style: TextStyle(fontSize: 18),
            // ),
          ],
        )
      ],
    ));
  }
}
