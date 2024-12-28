import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:devpaul_co/presentation/shared/custom_dev_card.dart';

class AboutViewLg extends StatelessWidget {
  const AboutViewLg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      // margin: const EdgeInsets.symmetric(vertical: 56, horizontal: 80),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025,
            // horizontal: 32,
            vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: MediaQuery.of(context).size.width * 0.8,
              height: size.height * 0.27,
              // color: Colors.red,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.017),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(
                    child: Container(
                      width: size.width * 0.255,
                      height: size.width * 0.255,
                      margin: EdgeInsets.only(right: size.width * 0.005),
                      decoration: BoxDecoration(
                          color: const Color(0xff443357),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff443357).withOpacity(0.5),
                              offset: const Offset(
                                10.0,
                                10.0,
                              ),
                              blurRadius: 20.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          border:
                              Border.all(color: Color(0xff011D2B), width: 6),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/paul.jpg'))),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.about_page_who_i_am,
                          style: GoogleFonts.inter(
                              color: const Color(0xff232835),
                              fontSize: 26,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .about_page_who_i_am_body,
                          style: GoogleFonts.inter(
                              color: const Color(0xff7B7E86),
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              // padding: EdgeInsets.symmetric(
              //     horizontal: MediaQuery.of(context).size.width * 0.025),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xff443357), Color(0xff394053)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      AppLocalizations.of(context)!.about_page_what_i_do,
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomDevCard(
                          icon: Icons.phone_android_rounded,
                          title: AppLocalizations.of(context)!
                              .about_page_mobile_dev_card,
                          body: AppLocalizations.of(context)!
                              .about_page_mobile_dev_card_body,
                          buttonText: 'See more',
                          height: size.height * 0.5,
                          width: 380,
                          delay: 100,
                          isFirst: true,
                        ),
                        CustomDevCard(
                          icon: Icons.web_asset_rounded,
                          title: AppLocalizations.of(context)!
                              .about_page_web_dev_card,
                          body: AppLocalizations.of(context)!
                              .about_page_web_dev_card_body,
                          buttonText: 'See more',
                          height: size.height * 0.5,
                          width: 380,
                          delay: 300,
                        ),
                        CustomDevCard(
                          icon: Icons.devices_other_rounded,
                          title: AppLocalizations.of(context)!
                              .about_page_backend_dev_card,
                          body: AppLocalizations.of(context)!
                              .about_page_backend_dev_card_body,
                          buttonText: 'See more',
                          height: size.height * 0.5,
                          width: 380,
                          delay: 600,
                        ),
                        CustomDevCard(
                          icon: Icons.rocket_launch_rounded,
                          title: AppLocalizations.of(context)!
                              .about_page_ai_chatbot_dev_card,
                          body: AppLocalizations.of(context)!
                              .about_page_ai_chatbot_dev_card_body,
                          buttonText: 'See more',
                          height: size.height * 0.5,
                          width: 380,
                          delay: 900,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
