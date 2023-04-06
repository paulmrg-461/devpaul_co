import 'package:devpaul_co/core/helpers/clip_paths/background_home_clippath.dart';
import 'package:devpaul_co/presentation/providers/page_provider.dart';
import 'package:devpaul_co/presentation/providers/tech_stack_provider.dart';
import 'package:devpaul_co/presentation/shared/custom_button.dart';
import 'package:devpaul_co/presentation/shared/custom_menu_item.dart';
import 'package:devpaul_co/presentation/shared/dev_paul_horizontal_logo.dart';
import 'package:devpaul_co/presentation/shared/tech_stack_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewLg extends StatelessWidget {
  final PageProvider pageProvider;
  final TechStackProvider techStackProvider;
  const HomeViewLg(
      {Key? key, required this.pageProvider, required this.techStackProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Stack(children: [
            ClipPath(
              clipper: BackgroundHomeClippath(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const RadialGradient(
                      center: Alignment.bottomLeft,
                      radius: 1,
                      colors: [Color(0xff443357), Color(0xff1F2631)],
                    )),
                width: double.infinity,
                height: 680,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.0285),
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: const DevPaulHorizontalLogo()),
                          const Spacer(),
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.06),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .home_page_title_1,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 38,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .home_page_title_2,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 38,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .home_page_title_3,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 38,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .home_page_professional_profile,
                                  style: GoogleFonts.inter(
                                      color: const Color(0xffA6A6A6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w100),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Row(
                                  children: [
                                    CustomButton(
                                        text: AppLocalizations.of(context)!
                                            .home_page_explore_button,
                                        backgroundColor:
                                            const Color(0xff2D69FD),
                                        borderColor: const Color(0xff2D69FD),
                                        buttonElevation: 10,
                                        internalVerticalPadding: 12,
                                        internalHorizontalPadding: 14,
                                        onPressed: () => pageProvider.goTo(1)),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                    CustomButton(
                                        text: AppLocalizations.of(context)!
                                            .home_page_whatsapp_button,
                                        backgroundColor: Colors.transparent,
                                        borderColor: Colors.white,
                                        internalVerticalPadding: 9,
                                        internalHorizontalPadding: 8,
                                        icon: FontAwesomeIcons.whatsapp,
                                        onPressed: () async {
                                          final Uri _url = Uri.parse(
                                              "https://web.whatsapp.com/send?phone=+573148580454&text=Hola");
                                          ;
                                          if (!await launchUrl(_url)) {
                                            throw 'Could not launch $_url';
                                          }
                                        }),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.width * 0.22,
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.035),
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
                          border: Border.all(color: Colors.white, width: 8),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/paul.jpg'))),
                    ),
                    Column(
                      children: [
                        CustomButton(
                          text: AppLocalizations.of(context)!.home_page_resume,
                          backgroundColor: Colors.transparent,
                          borderColor: Colors.white,
                          onPressed: () async {
                            final Uri _url = Uri.parse(
                                'https://drive.google.com/file/d/1jAPgDvxwXu2IE-Gcje66cQ8SGfgz1lmf/view?usp=sharing');
                            if (!await launchUrl(_url)) {
                              throw 'Could not launch $_url';
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 20,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.425,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomMenuItem(
                          text:
                              AppLocalizations.of(context)!.home_page_menu_home,
                          onPressed: () => pageProvider.goTo(0),
                          delay: 100),
                      CustomMenuItem(
                          text: AppLocalizations.of(context)!
                              .home_page_menu_about,
                          onPressed: () => pageProvider.goTo(1),
                          delay: 300),
                      CustomMenuItem(
                          text: AppLocalizations.of(context)!
                              .home_page_menu_contact,
                          onPressed: () => pageProvider.goTo(2),
                          delay: 600),
                      CustomMenuItem(
                          text: AppLocalizations.of(context)!
                              .home_page_menu_location,
                          onPressed: () => pageProvider.goTo(3),
                          delay: 900),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //     top: MediaQuery.of(context).size.height * 0.025,
            //     left: MediaQuery.of(context).size.width * 0.02,
            //     child: SizedBox(width: 225, child: DevPaulHorizontalLogo()))
          ]),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: TechStackListView(
                    techStackList: techStackProvider.techStackList)),
          ),
        ],
      ),
    );
  }
}
