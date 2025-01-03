// lib/presentation/views/contact_view_sm.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:devpaul_co/presentation/shared/collaborators_list_view.dart';
import 'package:devpaul_co/presentation/shared/contact_form.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';

class ContactViewSm extends StatelessWidget {
  final CollaboratorsProvider collaboratorsProvider;
  const ContactViewSm({Key? key, required this.collaboratorsProvider})
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
                // Título
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    AppLocalizations.of(context)!.contact_page_work_together,
                    style: GoogleFonts.inter(
                        color: const Color(0xff232835),
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                // Descripción
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 18, left: 24, right: 24),
                  child: Text(
                    AppLocalizations.of(context)!
                        .contact_page_work_together_body,
                    style: GoogleFonts.inter(
                        color: const Color(0xff7B7E86),
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                    textAlign: TextAlign.justify,
                  ),
                ),
                // Campos del formulario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ContactForm(width: size.width * 0.8),
                ),
                // Botón de envío está incluido en ContactForm
                const SizedBox(height: 20), // Espaciador
                // Sección de colaboradores
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 12),
                  child: Text(
                    AppLocalizations.of(context)!
                        .contact_page_team_colaborators,
                    style: GoogleFonts.inter(
                        color: const Color(0xff232835),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
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
