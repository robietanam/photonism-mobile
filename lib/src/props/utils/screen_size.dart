import 'package:flutter/material.dart';

class ScreenSizeAndro {
  late Size screenSize;
  late double width;
  late double height;
  ScreenSizeAndro({required BuildContext context}) {
    screenSize = MediaQuery.of(context).size;
    width = screenSize.width;
    height = screenSize.height;
  }
}
