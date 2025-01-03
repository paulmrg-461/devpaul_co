// lib/presentation/views/contact_view_md.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:devpaul_co/presentation/shared/collaborators_list_view.dart';
import 'package:devpaul_co/presentation/shared/contact_form.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';

class ContactViewMd extends StatelessWidget {
  final CollaboratorsProvider collaboratorsProvider;
  const ContactViewMd({Key? key, required this.collaboratorsProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: size.height * 0.065, top: size.height * 0.11),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    AppLocalizations.of(context)!.contact_page_work_together,
                    style: GoogleFonts.inter(
                        color: const Color(0xff232835),
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                // Descripción
                Padding(
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 26, left: 28, right: 28),
                  child: Text(
                    AppLocalizations.of(context)!
                        .contact_page_work_together_body,
                    style: GoogleFonts.inter(
                        color: const Color(0xff7B7E86),
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.justify,
                  ),
                ),
                // Campos del formulario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: ContactForm(width: size.width * 0.6),
                ),
                const SizedBox(height: 20), // Espaciador
                // Sección de colaboradores
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    AppLocalizations.of(context)!
                        .contact_page_team_colaborators,
                    style: GoogleFonts.inter(
                        color: const Color(0xff232835),
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 26, left: 28, right: 28),
                  child: Text(
                    AppLocalizations.of(context)!
                        .contact_page_team_colaborators_body,
                    style: GoogleFonts.inter(
                        color: const Color(0xff7B7E86),
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.justify,
                  ),
                ),
                CollaboratorsListView(
                  collaborators: collaboratorsProvider.collaborators,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
