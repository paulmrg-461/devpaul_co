// contact_view_sm.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';
import 'package:devpaul_co/presentation/shared/shared.dart';
import 'package:devpaul_co/core/validators/input_validators.dart';

class ContactViewSm extends StatefulWidget {
  final CollaboratorsProvider collaboratorsProvider;
  const ContactViewSm({Key? key, required this.collaboratorsProvider})
      : super(key: key);

  @override
  State<ContactViewSm> createState() => _ContactViewSmState();
}

class _ContactViewSmState extends State<ContactViewSm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cellphoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    // Dispose de los controladores para evitar fugas de memoria
    nameController.dispose();
    emailController.dispose();
    cellphoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String cellphone = cellphoneController.text.trim();
    final String message = messageController.text.trim();

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'co.devpaul@gmail.com',
      queryParameters: {
        'subject': 'Mensaje de $name desde DevPaul Portfolio',
        'body':
            'Nombre: $name\nEmail: $email\nTeléfono: $cellphone\n\nMensaje:\n$message',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text(AppLocalizations.of(context)!.could_not_launch_email)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        // Añadido para manejar desbordamientos en pantallas pequeñas
        child: Padding(
          padding: EdgeInsets.only(
              bottom: size.height * 0.065, top: size.height * 0.11),
          child: Form(
            key: formKey,
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
                  child: CustomInput(
                    hintText: AppLocalizations.of(context)!
                        .contact_page_form_fullname,
                    controller: nameController,
                    validator: (value) =>
                        InputValidator.emptyValidator(value: value),
                    textInputType: TextInputType.name,
                    icon: Icons.person_outline_outlined,
                    textCapitalization: TextCapitalization.sentences,
                    fontColor: const Color(0xff7B7E86),
                    borderColor: const Color(0xff2D69FD),
                    obscureText: false,
                    enabledInputInteraction: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomInput(
                    hintText:
                        AppLocalizations.of(context)!.contact_page_form_email,
                    controller: emailController,
                    validator: (value) => InputValidator.emailValidator(value),
                    textInputType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                    fontColor: const Color(0xff7B7E86),
                    borderColor: const Color(0xff2D69FD),
                    obscureText: false,
                    enabledInputInteraction: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomInput(
                    hintText:
                        AppLocalizations.of(context)!.contact_page_form_phone,
                    controller: cellphoneController,
                    validator: (value) => InputValidator.phoneValidator(value),
                    textInputType: TextInputType.phone,
                    icon: Icons.phone_outlined,
                    fontColor: const Color(0xff7B7E86),
                    borderColor: const Color(0xff2D69FD),
                    obscureText: false,
                    enabledInputInteraction: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomInput(
                    hintText:
                        AppLocalizations.of(context)!.contact_page_form_message,
                    controller: messageController,
                    validator: (value) =>
                        InputValidator.emptyValidator(value: value),
                    textInputType: TextInputType.multiline,
                    icon: Icons.message_outlined,
                    fontColor: const Color(0xff7B7E86),
                    borderColor: const Color(0xff2D69FD),
                    minLines: 2,
                    maxLines: 16,
                    obscureText: false,
                    enabledInputInteraction: true,
                  ),
                ),
                // Botón de envío
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text:
                          AppLocalizations.of(context)!.home_page_menu_contact,
                      backgroundColor: Colors.transparent,
                      fontColor: const Color(0xff2D69FD),
                      buttonElevation: 0,
                      borderColor: const Color(0xff2D69FD),
                      onPressed: () {
                        final isValid = formKey.currentState!.validate();
                        if (isValid) {
                          _sendEmail();
                        }
                      },
                    ),
                  ],
                ),
                // Espaciador para empujar el contenido hacia arriba
                const SizedBox(height: 20),
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
                  collaborators: widget.collaboratorsProvider.collaborators,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
