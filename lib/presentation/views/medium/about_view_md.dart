import 'package:devpaul_co/shared/data/local_dev_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutViewMd extends StatelessWidget {
  const AboutViewMd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      // margin: const EdgeInsets.symmetric(vertical: 56, horizontal: 80),
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.14,
          bottom: size.height * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                AppLocalizations.of(context)!.about_page_who_i_am,
                style: GoogleFonts.inter(
                    color: const Color(0xff232835),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                """Laborum ipsum pariatur fugiat occaecat quis est et non occaecat sit. Aliqua laboris velit labore ut irure. Ut proident sit velit nisi consequat sit cillum eiusmod magna esse adipisicing dolore. Ex sit est aute ipsum exercitation. Labore id occaecat ad irure commodo ex. Nulla anim commodo officia Lorem incididunt consectetur. Enim occaecat nulla laboris culpa commodo ad.""",
                style: GoogleFonts.inter(
                    color: const Color(0xff7B7E86),
                    fontSize: 18,
                    fontWeight: FontWeight.w200),
                textAlign: TextAlign.justify,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                AppLocalizations.of(context)!.about_page_what_i_do,
                style: GoogleFonts.inter(
                    color: const Color(0xff232835),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            LocalDevCards(
              width: size.width * 0.4,
              height: size.height * 0.5,
            )
          ],
        ),
      ),
    );
  }
}
