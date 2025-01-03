import 'package:devpaul_co/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:devpaul_co/presentation/providers/page_provider.dart';

class LocationViewSm extends StatelessWidget {
  final PageProvider pageProvider;
  const LocationViewSm({Key? key, required this.pageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(bottom: 14, top: size.height * 0.11, left: 28),
            child: Text(
              AppLocalizations.of(context)!.home_page_menu_location,
              style: GoogleFonts.inter(
                  color: const Color(0xff232835),
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, bottom: 14),
            child: Text(
              AppLocalizations.of(context)!.location_page_location_text,
              style: GoogleFonts.inter(
                  color: const Color(0xff7B7E86),
                  fontSize: 14,
                  fontWeight: FontWeight.w200),
              textAlign: TextAlign.justify,
            ),
          ),
          Expanded(child: getMap()),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.36,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff443357), Color(0xff394053)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.location_page_contact_us,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const ContactItem(
                    imagePath: 'assets/logos/email.svg',
                    semanticLabel: 'Email label',
                    text: 'co.devpaul@gmail.com',
                    url:
                        'mailto:co.devpaul@gmail.com?subject=Contacto&body=Hola Paul, estoy interesado en...'),
                const ContactItem(
                    imagePath: 'assets/logos/phone.svg',
                    semanticLabel: 'Phone label',
                    text: '+(57) 3148580454',
                    url: 'whatsapp://send?phone=+573148580454&text=Hola'),
                const ContactItem(
                    imagePath: 'assets/logos/location.svg',
                    semanticLabel: 'Location label',
                    text:
                        'Popayán Cauca Colombia - Tv. 7 #51N-24\nClub residencial Camino Viejo  ',
                    url:
                        'https://www.google.com/maps/place/DevPaul/@2.4554602,-76.5940771,15z/data=!4m5!3m4!1s0x0:0x5dfe0cc97107e505!8m2!3d2.4554602!4d-76.5940771'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconUrl(
                      path: 'assets/logos/facebook.svg',
                      onPressed: () async {
                        final Uri url =
                            Uri.parse('https://www.facebook.com/devpaul.co/');
                        if (!await launchUrl(url)) {
                          throw 'Could not launch $url';
                        }
                      },
                      label: 'Facebook Logo',
                      width: 45,
                      height: 45,
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
                      width: 45,
                      height: 45,
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
                      width: 45,
                      height: 45,
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
                      width: 45,
                      height: 45,
                    ),
                    CustomIconUrl(
                      path: 'assets/logos/instagram.svg',
                      onPressed: () async {
                        final Uri url =
                            Uri.parse('https://www.instagram.com/devpaul_co/');
                        if (!await launchUrl(url)) {
                          throw 'Could not launch $url';
                        }
                      },
                      label: 'Instagram Logo',
                      width: 45,
                      height: 45,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String imagePath;
  final String semanticLabel;
  final String text;
  final String url;

  const ContactItem({
    super.key,
    required this.imagePath,
    required this.semanticLabel,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          semanticsLabel: semanticLabel,
          width: 40,
        ),
        const SizedBox(
          width: 12,
        ),
        CustomMenuItemFooter(
            text: text,
            fontSize: 14,
            onPressed: () async {
              final Uri uri = Uri.parse(url);
              if (!await launchUrl(uri)) {
                throw 'Could not launch $uri';
              }
            })
      ],
    );
  }
}
