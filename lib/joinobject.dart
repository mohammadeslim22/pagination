class JoinObject {
  int _id;
  String _title;
  String name;
  String phones;
  int noteid;
  int userId;
  String _description;

  JoinObject(this._title, this.name, [this.phones]);

  JoinObject.withId(this._id, this._title,
      [this.phones, this.noteid, this.userId, this._description]);

  int get id => _id;

  int get title => title;

  String get description => phones;

  set set_title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set phone(String newDescription) {
    if (newDescription.length <= 255) {
      this.phones = newDescription;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['name'] = name;
    map['phones'] = phones;
    map['noteid'] = noteid;
    map['user_id'] = userId;

    map['_description'] = _description;

    return map;
  }

  // Extract a Note object from a Map object
  JoinObject.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this.name = map['name'];
    this.phones = map['phones'];
    this.noteid = map['noteid'];
    this.userId = map['user_id'];
    this._description = map['_description'];
  }


  @override
  String toString() {
    print(_id.toString()+" "+_title+" "+name+" "+phones+" "+noteid.toString()+" "+userId.toString()+" "+_description);
  }
}
