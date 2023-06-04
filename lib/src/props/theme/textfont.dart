import 'package:flutter/material.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color => color != null ? color! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color: _color),
    );
  }
}

class TextJudul extends StatelessWidget {
  const TextJudul({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color => color != null ? color! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _color),
    );
  }
}

class TextSubJudul extends StatelessWidget {
  const TextSubJudul({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color =>
      color != null ? color! : Color.fromARGB(255, 163, 163, 163);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: _color),
    );
  }
}

class TextAppBar extends StatelessWidget {
  const TextAppBar({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color => color != null ? color! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _color),
    );
  }
}

class TextJudul1 extends StatelessWidget {
  const TextJudul1({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color => color != null ? color! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _color),
    );
  }
}

class TextJudul2 extends StatelessWidget {
  const TextJudul2({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color => color != null ? color! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: _color),
    );
  }
}

class TextNavbar extends StatelessWidget {
  const TextNavbar({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color => color != null ? color! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: _color),
    );
  }
}

class TextDeskripsi1 extends StatelessWidget {
  const TextDeskripsi1({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color => color != null ? color! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: 11, fontWeight: FontWeight.normal, color: _color),
    );
  }
}
