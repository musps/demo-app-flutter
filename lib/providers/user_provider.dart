import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/models/user_model.dart';

class UserProvider with ChangeNotifier {
  // shared preferences key.
  static final userKey = 'user';

  // Current logged user.
  User user;

  // List of available users.
  List<User> users = [
    User(email: 'sercan', password: 'root', firstname: 'Sercan', lastname: 'YILDIZ'),
    User(email: 'root', password: 'root', firstname: 'root', lastname: 'root'),
  ];

  Future<bool> initialize() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var json = prefs.getString(userKey) ?? null;
      if (json == null) {
        return false;
      }

      User _user = User.fromJson(jsonDecode(json));
      user = _user;
      return true;
  }

  Future<bool> login({String email, String password}) async {
    User findUser = users.firstWhere((User u) => (u.email == email && u.password == password), orElse: () => null);
    if (findUser == null) {
      return false;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(findUser.toJSON()));
    return true;
  }

  Future disconnect() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
    notifyListeners();
  }
}
