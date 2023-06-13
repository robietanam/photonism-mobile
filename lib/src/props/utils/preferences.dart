import 'package:shared_preferences/shared_preferences.dart';

import '../../models/users.dart';

void upDateSharedPreferencesUser(User user) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  _prefs.setStringList('user', User.toList(user));
}

void removeSharedPreferencesUser() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  _prefs.remove('user');
}
