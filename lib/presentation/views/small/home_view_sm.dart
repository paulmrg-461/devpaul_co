import 'package:devpaul_co/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:devpaul_co/presentation/providers/providers.dart';

class HomeViewSm extends StatelessWidget {
  final PageProvider pageProvider;
  final TechStackProvider techStackProvider;

  const HomeViewSm(
      {Key? key, required this.pageProvider, required this.techStackProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    TextStyle getTextStyle(
            {Color color = Colors.white,
            double size = 40,
            FontWeight weight = FontWeight.w600}) =>
        GoogleFonts.inter(color: color, fontSize: size, fontWeight: weight);

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 26, bottom: 18),
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                center: Alignment.bottomLeft,
                radius: 1,
                colors: [Color(0xff443357), Color(0xff1F2631)],
              )),
              width: double.infinity,
              height: size.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(AppLocalizations.of(context)!.home_page_title_1,
                      style: getTextStyle()),
                  Text(AppLocalizations.of(context)!.home_page_title_2,
                      style: getTextStyle()),
                  Text(AppLocalizations.of(context)!.home_page_title_3,
                      style: getTextStyle(size: 26, weight: FontWeight.w400)),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                      AppLocalizations.of(context)!
                          .home_page_professional_profile,
                      style: getTextStyle(
                          color: const Color(0xffA6A6A6),
                          size: 15,
                          weight: FontWeight.w200)),
                  const Spacer(),
                  CustomButton(
                    text:
                        AppLocalizations.of(context)!.home_page_explore_button,
                    backgroundColor: const Color(0xff2D69FD),
                    borderColor: const Color(0xff2D69FD),
                    buttonElevation: 10,
                    internalVerticalPadding: 9,
                    internalHorizontalPadding: 12,
                    width: 240,
                    onPressed: () => pageProvider.goTo(1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22, top: 6),
                    child: CustomButton(
                        text: AppLocalizations.of(context)!
                            .home_page_whatsapp_button,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.white,
                        internalVerticalPadding: 9,
                        internalHorizontalPadding: 12,
                        icon: FontAwesomeIcons.whatsapp,
                        width: 240,
                        onPressed: () async {
                          final Uri url = Uri.parse(
                              "whatsapp://send?phone=+573148580454&text=Hola");

                          if (!await launchUrl(url)) {
                            throw 'Could not launch $url';
                          }
                        }),
                  ),
                ],
              ),
            )
          ]),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: TechStackListView(
                    techStackList: techStackProvider.techStackList)),
          ),
        ],
      ),
    );
  }
}
