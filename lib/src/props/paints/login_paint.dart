import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 175, 1, 113)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0, size.width * 0.0);
    path0.lineTo(size.width * 0.0, size.width * 0.65);
    path0.quadraticBezierTo(size.width * 0.00, size.width * 0.7000000,
        size.width * 0.08, size.width * 0.7000000);
    path0.lineTo(
      size.width * 0.9,
      size.width * 0.7000000,
    );
    path0.quadraticBezierTo(
        size.width * 1, size.width * 0.7, size.width * 1, size.width * 0.75);
    path0.lineTo(size.width * 1, size.width * 0);
    path0.lineTo(size.width * 0.0, size.width * 0.0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
