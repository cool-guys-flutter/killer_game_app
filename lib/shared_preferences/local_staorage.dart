import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:killer_game_app/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static User user = User(isNew: true);

  Future<void> userReadRules() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user.notNew();
    String userPref = user.encode();
    prefs.setString('user', userPref);
  }

  Future<bool> getUserNewness() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');
    if (userPref == null) {
      return true;
    } else {
      user = User.decode(userPref);
      return user.isNew;
    }
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');
    if (userPref == null) {
      return User(isNew: true);
    } else {
      user = User.decode(userPref);
      return user;
    }
  }
}

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});
