import 'package:devpaul_co/presentation/providers/page_provider.dart';
import 'package:devpaul_co/presentation/shared/custom_icon_url.dart';
import 'package:devpaul_co/presentation/shared/custom_menu_item_footer.dart';
import 'package:devpaul_co/presentation/shared/dev_paul_horizontal_logo.dart';
import 'package:devpaul_co/presentation/shared/location_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationViewLg extends StatelessWidget {
  final PageProvider pageProvider;
  const LocationViewLg({Key? key, required this.pageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.only(top: 10, bottom: 6),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.home_page_menu_location,
                    style: GoogleFonts.inter(
                        color: const Color(0xff232835),
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    AppLocalizations.of(context)!.location_page_location_text,
                    style: GoogleFonts.inter(
                        color: const Color(0xff7B7E86),
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: getMap()),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff443357), Color(0xff394053)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const DevPaulHorizontalLogo(),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Column(
                          children: [
                            Text(
                              'Popayán Cauca',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Colombia 190002',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomIconUrl(
                            path: 'assets/logos/facebook.svg',
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  'https://www.facebook.com/devpaul.co/');
                              if (!await launchUrl(url)) {
                                throw 'Could not launch $url';
                              }
                            },
                            label: 'Facebook Logo',
                            width: MediaQuery.of(context).size.width * 0.0285,
                            height: MediaQuery.of(context).size.width * 0.0285,
                          ),
                          CustomIconUrl(
                            path: 'assets/logos/twitter.svg',
                            onPressed: () async {
                              final Uri url =
                                  Uri.parse('https://twitter.com/devpaul_co');
                              if (!await launchUrl(url)) {
                                throw 'Could not launch $url';
                              }
                            },
                            label: 'Twitter Logo',
                            width: MediaQuery.of(context).size.width * 0.0285,
                            height: MediaQuery.of(context).size.width * 0.0285,
                          ),
                          CustomIconUrl(
                            path: 'assets/logos/linkedin.svg',
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  'https://www.linkedin.com/in/paul-mauricio-realpe-guerrero-631b17a6/');
                              if (!await launchUrl(url)) {
                                throw 'Could not launch $url';
                              }
                            },
                            label: 'LinkedIn Logo',
                            width: MediaQuery.of(context).size.width * 0.0285,
                            height: MediaQuery.of(context).size.width * 0.0285,
                          ),
                          CustomIconUrl(
                            path: 'assets/logos/github.svg',
                            onPressed: () async {
                              final Uri url =
                                  Uri.parse('https://github.com/paulmrg-461');
                              if (!await launchUrl(url)) {
                                throw 'Could not launch $url';
                              }
                            },
                            label: 'Github Logo',
                            width: MediaQuery.of(context).size.width * 0.0285,
                            height: MediaQuery.of(context).size.width * 0.0285,
                          ),
                          CustomIconUrl(
                            path: 'assets/logos/instagram.svg',
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  'https://www.instagram.com/devpaul_co/');
                              if (!await launchUrl(url)) {
                                throw 'Could not launch $url';
                              }
                            },
                            label: 'Instagram Logo',
                            width: MediaQuery.of(context).size.width * 0.0285,
                            height: MediaQuery.of(context).size.width * 0.0285,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Technologies',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomMenuItemFooter(
                              text: 'Flutter',
                              onPressed: () async {
                                final Uri url =
                                    Uri.parse('https://flutter.dev/');
                                if (!await launchUrl(url)) {
                                  throw 'Could not launch $url';
                                }
                              }),
                          CustomMenuItemFooter(
                              text: 'React',
                              onPressed: () async {
                                final Uri url =
                                    Uri.parse('https://es.reactjs.org/');
                                if (!await launchUrl(url)) {
                                  throw 'Could not launch $url';
                                }
                              }),
                          CustomMenuItemFooter(
                              text: 'Kotlin',
                              onPressed: () async {
                                final Uri url = Uri.parse(
                                    'https://developer.android.com/kotlin/');
                                if (!await launchUrl(url)) {
                                  throw 'Could not launch $url';
                                }
                              }),
                          CustomMenuItemFooter(
                              text: 'Swift',
                              onPressed: () async {
                                final Uri url = Uri.parse(
                                    'https://www.apple.com/co/swift/');
                                if (!await launchUrl(url)) {
                                  throw 'Could not launch $url';
                                }
                              }),
                          CustomMenuItemFooter(
                              text: 'Python',
                              onPressed: () async {
                                final Uri url =
                                    Uri.parse('https://www.python.org/');
                                if (!await launchUrl(url)) {
                                  throw 'Could not launch $url';
                                }
                              }),
                          CustomMenuItemFooter(
                              text: 'Firebase',
                              onPressed: () async {
                                final Uri url =
                                    Uri.parse('https://firebase.google.com/');
                                if (!await launchUrl(url)) {
                                  throw 'Could not launch $url';
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Main links',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomMenuItemFooter(
                              text: 'Home',
                              onPressed: () => pageProvider.goTo(0)),
                          CustomMenuItemFooter(
                              text: 'About',
                              onPressed: () => pageProvider.goTo(1)),
                          CustomMenuItemFooter(
                              text: 'Contact',
                              onPressed: () => pageProvider.goTo(2)),
                          CustomMenuItemFooter(
                              text: 'Location',
                              onPressed: () => pageProvider.goTo(3)),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Me',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/logos/email.svg',
                                semanticsLabel: 'Email Logo',
                                width:
                                    MediaQuery.of(context).size.width * 0.0285,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              CustomMenuItemFooter(
                                  text: 'co.devpaul@gmail.com',
                                  onPressed: () async {
                                    final Uri url = Uri.parse(
                                        'mailto:co.devpaul@gmail.com?subject=Contacto&body=Hola Paul, estoy interesado en...');
                                    if (!await launchUrl(url)) {
                                      throw 'Could not launch $url';
                                    }
                                  })
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/logos/phone.svg',
                                semanticsLabel: 'Phone Logo',
                                width:
                                    MediaQuery.of(context).size.width * 0.0285,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              CustomMenuItemFooter(
                                  text: '+(57) 3148580454',
                                  onPressed: () async {
                                    final Uri url = Uri.parse(
                                        "https://web.whatsapp.com/send?phone=+573148580454&text=Hola");
                                    if (!await launchUrl(url)) {
                                      throw 'Could not launch $url';
                                    }
                                  })
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/logos/location.svg',
                                semanticsLabel: 'Location Logo',
                                height:
                                    MediaQuery.of(context).size.width * 0.0285,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              CustomMenuItemFooter(
                                  text:
                                      'Popayán Cauca Colombia - Tv. 7 #51N-24\nClub residencial Camino Viejo  ',
                                  onPressed: () async {
                                    final Uri url = Uri.parse(
                                        "https://www.google.com/maps/place/DevPaul/@2.4554602,-76.5940771,15z/data=!4m5!3m4!1s0x0:0x5dfe0cc97107e505!8m2!3d2.4554602!4d-76.5940771");
                                    if (!await launchUrl(url)) {
                                      throw 'Could not launch $url';
                                    }
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
