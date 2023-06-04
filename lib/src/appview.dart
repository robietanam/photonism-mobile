import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pbm_uas/src/views/auth/login_view.dart';
import 'controller/auth/data_source/auth_data_source.dart';
import 'props/theme/app_theme.dart';
import 'props/theme/textfont.dart';
import 'views/homepage/homepage_main.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}

class RoutePage extends ConsumerStatefulWidget {
  const RoutePage({super.key});

  @override
  ConsumerState<RoutePage> createState() => _routePageState();
}

class _routePageState extends ConsumerState<RoutePage> {
  bool _isLoggedin = false;
  User? _user;
  @override
  void initState() {
    final user = ref.read(authDataSourceProvider).getCurrentUser();

    if (user != null) {
      setState(() {
        _user = user;
        _isLoggedin = true;
      });
    } else {
      setState(() {
        _isLoggedin = false;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedin ? HomePageView() : LoginPageView();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    Size screenSize = WidgetsBinding.instance.window.physicalSize;

    width = screenSize.width;
    height = screenSize.height;

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RoutePage())));
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
