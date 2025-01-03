// lib/presentation/views/contact_view_lg.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';
import 'package:devpaul_co/presentation/shared/collaborators_list_view.dart';
import 'package:devpaul_co/presentation/shared/contact_form.dart';
import 'package:devpaul_co/presentation/shared/shared.dart';

class ContactViewLg extends StatelessWidget {
  final CollaboratorsProvider collaboratorsProvider;
  const ContactViewLg({Key? key, required this.collaboratorsProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        // Para manejar desbordamientos en pantallas grandes
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sección de colaboradores
            SizedBox(
              width: double.infinity,
              height: size.height * 0.34,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04, top: 26),
                    child: Text(
                      AppLocalizations.of(context)!
                          .contact_page_team_colaborators,
                      style: GoogleFonts.inter(
                          color: const Color(0xff232835),
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: size.width * 0.6,
                    margin: EdgeInsets.only(top: 10, left: size.width * 0.04),
                    child: Text(
                      AppLocalizations.of(context)!
                          .contact_page_team_colaborators_body,
                      style: GoogleFonts.inter(
                          color: const Color(0xff7B7E86),
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(),
                  ),
                  CollaboratorsListView(
                    collaborators: collaboratorsProvider.collaborators,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(),
                  ),
                ],
              ),
            ),
            // Sección de formulario
            Container(
              width: double.infinity,
              height: size.height * 0.56,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    // Usar Expanded para adaptabilidad
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .contact_page_work_together,
                          style: GoogleFonts.inter(
                              color: const Color(0xff232835),
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: size.width * 0.4,
                          margin: const EdgeInsets.only(top: 14, bottom: 36),
                          child: Text(
                            AppLocalizations.of(context)!
                                .contact_page_work_together_body,
                            style: GoogleFonts.inter(
                                color: const Color(0xff7B7E86),
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: ContactForm(width: size.width * 0.35),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.24,
                    height: size.width * 0.24,
                    margin: EdgeInsets.only(right: size.width * 0.035),
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
                        border: Border.all(
                            color: const Color(0xff011D2B), width: 12),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/logos/devpaul_logo.png'))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
