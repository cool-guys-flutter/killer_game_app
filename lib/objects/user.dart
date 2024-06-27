import 'dart:convert';

class User {
  bool isNew = true;

  User(
    {required 
      this.isNew
    }
  );

  void notNew() {
    isNew = false;
  }

  Map<String, dynamic> toMap() {
    return {
      'isNew': isNew,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      isNew: map['isNew'],
    );
  }

  String encode() {
    return json.encode(toMap());
  }

  factory User.decode(String jsonString) {
    return User.fromMap(json.decode(jsonString));
  }
}