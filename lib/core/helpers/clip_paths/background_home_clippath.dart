import 'package:flutter/material.dart';

class BackgroundHomeClippath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height * 0.02708804);
    path.cubicTo(0, size.height * 0.01212777, size.width * 0.007631534, 0,
        size.width * 0.01704545, 0);
    path.lineTo(size.width * 0.2437315, 0);
    path.cubicTo(
        size.width * 0.2477784,
        0,
        size.width * 0.2516925,
        size.height * 0.002287460,
        size.width * 0.2547749,
        size.height * 0.006453284);
    path.lineTo(size.width * 0.2981371, size.height * 0.06505835);
    path.cubicTo(
        size.width * 0.3012195,
        size.height * 0.06922415,
        size.width * 0.3051335,
        size.height * 0.07151163,
        size.width * 0.3091797,
        size.height * 0.07151163);
    path.lineTo(size.width * 0.5063920, size.height * 0.07151163);
    path.lineTo(size.width * 0.6869233, size.height * 0.07151163);
    path.cubicTo(
        size.width * 0.6907472,
        size.height * 0.07151163,
        size.width * 0.6944602,
        size.height * 0.06946806,
        size.width * 0.6974659,
        size.height * 0.06570937);
    path.lineTo(size.width * 0.7453622, size.height * 0.005802269);
    path.cubicTo(size.width * 0.7483665, size.height * 0.002043612,
        size.width * 0.7520810, 0, size.width * 0.7559020, 0);
    path.lineTo(size.width * 0.9829545, 0);
    path.cubicTo(size.width * 0.9923651, 0, size.width,
        size.height * 0.01212777, size.width, size.height * 0.02708804);
    path.lineTo(size.width, size.height * 0.9729120);
    path.cubicTo(size.width, size.height * 0.9878725, size.width * 0.9923651,
        size.height, size.width * 0.9829545, size.height);
    path.lineTo(size.width * 0.01704545, size.height);
    path.cubicTo(size.width * 0.007631463, size.height, 0,
        size.height * 0.9878725, 0, size.height * 0.9729120);
    path.lineTo(0, size.height * 0.02708804);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
