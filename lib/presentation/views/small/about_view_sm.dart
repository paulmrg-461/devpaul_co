import 'package:devpaul_co/shared/data/local_dev_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutViewSm extends StatelessWidget {
  const AboutViewSm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      // margin: const EdgeInsets.symmetric(vertical: 56, horizontal: 80),
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.1,
          bottom: size.height * 0.06,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                AppLocalizations.of(context)!.about_page_who_i_am,
                style: GoogleFonts.inter(
                    color: const Color(0xff232835),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                AppLocalizations.of(context)!.about_page_who_i_am_body,
                overflow: TextOverflow.ellipsis,
                maxLines: 17,
                style: GoogleFonts.inter(
                    color: const Color(0xff7B7E86),
                    fontSize: 14,
                    letterSpacing: 0.075,
                    fontWeight: FontWeight.w200),
                textAlign: TextAlign.justify,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                AppLocalizations.of(context)!.about_page_what_i_do,
                style: GoogleFonts.inter(
                    color: const Color(0xff232835),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            LocalDevCards(
              width: 400,
              height: size.height * 0.43,
              margin: 16,
            )
          ],
        ),
      ),
    );
  }
}
