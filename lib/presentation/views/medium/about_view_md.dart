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
          top: size.height * 0.1,
          bottom: size.height * 0.025,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                AppLocalizations.of(context)!.about_page_who_i_am,
                style: GoogleFonts.inter(
                    color: const Color(0xff232835),
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                AppLocalizations.of(context)!.about_page_who_i_am_body,
                style: GoogleFonts.inter(
                    color: const Color(0xff7B7E86),
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.justify,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                AppLocalizations.of(context)!.about_page_what_i_do,
                style: GoogleFonts.inter(
                    color: const Color(0xff232835),
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            LocalDevCards(
              width: 360,
              height: size.height * 0.39,
            )
          ],
        ),
      ),
    );
  }
}
