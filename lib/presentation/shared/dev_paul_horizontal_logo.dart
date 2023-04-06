import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DevPaulHorizontalLogo extends StatelessWidget {
  const DevPaulHorizontalLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logos/devpaul.svg',
            semanticsLabel: 'DevPaul Logo',
            width: 44,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            '<dev',
            style: GoogleFonts.pressStart2p(
                color: const Color(0xffAD54C2), fontSize: 22),
          ),
          Text(
            'paul/>',
            style: GoogleFonts.pressStart2p(
                color: const Color(0xff2D69FD), fontSize: 22),
          ),
        ],
      ),
    );
  }
}
