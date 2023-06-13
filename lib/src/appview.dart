import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pbm_uas/src/views/auth/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/users.dart';
import 'props/theme/app_theme.dart';
import 'props/theme/textfont.dart';
import 'views/homepage/homepage_main.dart';

class AppView extends StatelessWidget {
  const AppView({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(user: user),
    );
  }
}

class RoutePage extends ConsumerStatefulWidget {
  const RoutePage({super.key, this.user});

  final User? user;

  @override
  ConsumerState<RoutePage> createState() => _routePageState();
}

class _routePageState extends ConsumerState<RoutePage> {
  bool _isLoggedin = false;

  late User? _user;

  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_user != null)
        ? HomePageView(
            user: _user!,
          )
        : LoginPageView();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.user});

  final User? user;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  late double width;
  late double height;

  late User? user;

  @override
  void initState() {
    super.initState();
    Size screenSize = WidgetsBinding.instance.window.physicalSize;

    width = screenSize.width;
    height = screenSize.height;
    user = widget.user;

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => RoutePage(user: user))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width / 6,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/app-icon.png',
                    scale: 1,
                  ),
                ),
                Container(
                  width: width / 4,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  child: const TextLogo(
                    text: 'Photonism',
                  ),
                ),
                Container(
                  width: width / 4,
                  alignment: Alignment.center,
                  child: const TextJudul(
                    text: 'Share moment pariwisatamu',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
