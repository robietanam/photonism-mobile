import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme._();

  static const _defaultElevation = 2.5;

  static ThemeData _baseTheme(
    Brightness brightness, {
    Color? textColor,
    Color? accentColor,
    Color? onAccentColor,
    Color? scaffoldBackgroundColor,
  }) {
    late final ColorScheme defaultColorScheme;
    late final SystemUiOverlayStyle systemUiOverlayStyle;
    switch (brightness) {
      case Brightness.light:
        defaultColorScheme = const ColorScheme.light();
        systemUiOverlayStyle = SystemUiOverlayStyle.dark;
        textColor ??= Colors.black;
        break;
      case Brightness.dark:
        defaultColorScheme = const ColorScheme.dark();
        systemUiOverlayStyle = SystemUiOverlayStyle.light;
        textColor ??= Colors.white;
        break;
    }

    return ThemeData(
      brightness: brightness,
      iconTheme: IconThemeData(color: textColor),
      scaffoldBackgroundColor: Color(0xFFF2F2F2),
      primaryColor: const Color(0xFFAF0171),
      fontFamily: 'Poppins',
      disabledColor: Colors.grey,
      appBarTheme: AppBarTheme(
        elevation: _defaultElevation,
        systemOverlayStyle: systemUiOverlayStyle,
        color: const Color(0xFFAF0171),
        iconTheme: IconThemeData(color: textColor),
        actionsIconTheme: IconThemeData(color: textColor),
        titleTextStyle: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'Poppins'),
      ),
      colorScheme: defaultColorScheme.copyWith(
        brightness: brightness,
        secondaryContainer: Color.fromARGB(255, 148, 148, 148),
        primary: accentColor,
        secondary: accentColor,
        onSecondary: onAccentColor ?? textColor,
      ),
      dialogTheme: DialogTheme(
        elevation: _defaultElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: _defaultElevation,
        highlightElevation: _defaultElevation * 2,
        // backgroundColor: accentColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFAF0171))),
      snackBarTheme: SnackBarThemeData(
        elevation: _defaultElevation,
        backgroundColor: accentColor,
        contentTextStyle: TextStyle(
          fontSize: 16,
          color: onAccentColor ?? textColor,
        ),
        behavior: SnackBarBehavior.floating,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
      // cupertinoOverrideTheme: CupertinoThemeData(
      //   brightness: brightness,
      //   scaffoldBackgroundColor: scaffoldBackgroundColor,
      // ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          for (final targetValue in TargetPlatform.values)
            targetValue: const _SlideLeftTransitionsBuilder(),
        },
      ),
    );
  }

  static final lightTheme = _baseTheme(
    Brightness.light,
    accentColor: const Color(0xFFAF0171),
    textColor: Colors.white,
    onAccentColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xFFDCDFE2),
  ).copyWith(
    cardColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFAF0171),
    ),
  );

  static final darkTheme = _baseTheme(
    Brightness.dark,
    accentColor: Colors.tealAccent,
    onAccentColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xFF040F2D),
  ).copyWith(
    cardColor: const Color(0xFF091642),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF050C25),
    ),
  );
}

class _SlideLeftTransitionsBuilder extends PageTransitionsBuilder {
  const _SlideLeftTransitionsBuilder();

  @override
  Widget buildTransitions<T>(_, __, animation, ___, child) {
    return SlideTransition(
      position: CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ).drive(Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      )),
      child: child,
    );
  }
}
