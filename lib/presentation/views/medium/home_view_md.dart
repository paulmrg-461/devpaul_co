import 'package:devpaul_co/presentation/providers/page_provider.dart';
import 'package:devpaul_co/presentation/providers/tech_stack_provider.dart';
import 'package:devpaul_co/presentation/shared/custom_button.dart';
import 'package:devpaul_co/presentation/shared/tech_stack_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewMd extends StatelessWidget {
  final PageProvider pageProvider;
  final TechStackProvider techStackProvider;

  const HomeViewMd(
      {Key? key, required this.pageProvider, required this.techStackProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    TextStyle getTextStyle(
            {Color color = Colors.white,
            double size = 48,
            FontWeight weight = FontWeight.w600}) =>
        GoogleFonts.inter(color: color, fontSize: size, fontWeight: weight);

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 26),
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
                    height: size.height * 0.18,
                  ),
                  Text(AppLocalizations.of(context)!.home_page_title_1,
                      style: getTextStyle()),
                  Text(AppLocalizations.of(context)!.home_page_title_2,
                      style: getTextStyle()),
                  Text(AppLocalizations.of(context)!.home_page_title_3,
                      style: getTextStyle(size: 36, weight: FontWeight.w400)),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                      AppLocalizations.of(context)!
                          .home_page_professional_profile,
                      style: getTextStyle(
                          color: const Color(0xffA6A6A6),
                          size: 24,
                          weight: FontWeight.w300)),
                  const Spacer(),
                  CustomButton(
                    text:
                        AppLocalizations.of(context)!.home_page_explore_button,
                    backgroundColor: const Color(0xff2D69FD),
                    borderColor: const Color(0xff2D69FD),
                    buttonElevation: 10,
                    internalVerticalPadding: 12,
                    internalHorizontalPadding: 14,
                    width: 240,
                    onPressed: () => pageProvider.goTo(1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32, top: 12),
                    child: CustomButton(
                        text: AppLocalizations.of(context)!
                            .home_page_whatsapp_button,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.white,
                        internalVerticalPadding: 12,
                        internalHorizontalPadding: 8,
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
