import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterViewLg extends StatelessWidget {
  const FooterViewLg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Footer',
            style: GoogleFonts.montserratAlternates(
                fontSize: 80, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
