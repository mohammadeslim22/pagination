class Note {
  int _id;
  int user_id;
  String _description;


  Note(this._id,this.user_id,
      [this._description]);

  Note.withId(this._id, this.user_id,
      [this._description]);

  int get id => _id;

  int get title => user_id;

  String get description => _description;


  set set_user_id(int newTitle) {
    if (newTitle <= 255) {
      this.user_id = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['note_id'] = _id;
    }
    map['user_id'] = user_id;
    map['desc'] = _description;
    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['note_id'];
    this.user_id = map['user_id'];
    this._description = map['desc'];
  }
}
