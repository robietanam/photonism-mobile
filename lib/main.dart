import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pbm_uas/src/appview.dart';
import 'package:pbm_uas/src/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID');

  final prefs = await SharedPreferences.getInstance();
  User? user;
  List<String>? listDataUser = prefs.getStringList("user");
  if (listDataUser != null) {
    user = User.fromList(listDataUser);
  }
  print(user);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(
      child: AppView(
    user: user,
  )));
}
