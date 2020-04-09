class User {
  int _id;
  String _title;
  String name;
  String phones;


  User(this._id,this._title,this.name,
      [this.phones]);

  User.withId(this._id, this._title,
      [this.phones]);

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
      map['user_id'] = _id;
    }
    map['title'] = _title;
    map['name'] = name;
    map['phones'] = phones;
    return map;
  }

  // Extract a Note object from a Map object
  User.fromMapObject(Map<String, dynamic> map) {
    this._id = map['user_id'];
    this._title = map['title'];
    this.name = map['name'];
    this.phones = map['phones'];
  }
}
