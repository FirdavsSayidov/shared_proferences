import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_proferences_2/modul/user_modul.dart';

class Prefs{


  static storeUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String StringUser = jsonEncode(user);
    prefs.setString('user', StringUser);
  }


  static Future loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString('user');
    if(stringUser == null || stringUser.isEmpty)
      return null;
    Map map = jsonDecode(stringUser);
    return User.fromJson(map, 'user');
  }

  static Future removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }
}

