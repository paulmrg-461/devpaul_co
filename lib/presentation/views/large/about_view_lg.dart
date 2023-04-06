import 'package:devpaul_co/presentation/shared/custom_dev_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutViewLg extends StatelessWidget {
  const AboutViewLg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // margin: const EdgeInsets.symmetric(vertical: 56, horizontal: 80),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.35,
              // color: Colors.red,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.3,
                      // width: MediaQuery.of(context).size.width * 0.25,
                      // height: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff443357), width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff443357).withOpacity(0.3),
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
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/paul2.jpg'))),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.075,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.about_page_who_i_am,
                          style: GoogleFonts.inter(
                              color: const Color(0xff232835),
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          """Laborum ipsum pariatur fugiat occaecat quis est et non occaecat sit. Aliqua laboris velit labore ut irure. Ex nostrud ad aliqua enim anim est. Ad aute ut voluptate consequat velit deserunt esse sunt proident ipsum laborum. Esse dolore duis dolore do anim. Deserunt sunt minim duis pariatur deserunt minim nostrud in sit cupidatat. Ut proident sit velit nisi consequat sit cillum eiusmod magna esse adipisicing dolore. Ex sit est aute ipsum exercitation. Labore id occaecat ad irure commodo ex. Nulla anim commodo officia Lorem incididunt consectetur. Enim occaecat nulla laboris culpa commodo ad. Excepteur duis nulla magna cillum enim qui dolor. Id cillum eiusmod adipisicing ut ullamco est nisi sit Lorem culpa. Amet occaecat amet mollit commodo aute qui velit deserunt quis labore aute.""",
                          style: GoogleFonts.inter(
                              color: const Color(0xff7B7E86),
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
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
            Text(
              AppLocalizations.of(context)!.about_page_what_i_do,
              style: GoogleFonts.inter(
                  color: const Color(0xff232835),
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xff443357), Color(0xff394053)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomDevCard(
                    icon: Icons.phone_android_rounded,
                    title: 'Mobile Development',
                    body:
                        'Occaecat id Lorem reprehenderit nulla aliqua ex tempor incididunt. Ea aliqua incididunt sint Lorem non sunt culpa nisi incididunt commodo.',
                    buttonText: 'See more',
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.22,
                    delay: 100,
                  ),
                  CustomDevCard(
                    icon: Icons.web_asset_rounded,
                    title: 'Web Development',
                    body:
                        'Occaecat id Lorem reprehenderit nulla aliqua ex tempor incididunt. Ea aliqua incididunt sint Lorem non sunt culpa nisi incididunt commodo.',
                    buttonText: 'See more',
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.22,
                    delay: 300,
                  ),
                  CustomDevCard(
                    icon: Icons.devices_other_rounded,
                    title: 'Backend Development',
                    body:
                        'Occaecat id Lorem reprehenderit nulla aliqua ex tempor incididunt. Ea aliqua incididunt sint Lorem non sunt culpa nisi incididunt commodo.',
                    buttonText: 'See more',
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.22,
                    delay: 600,
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
