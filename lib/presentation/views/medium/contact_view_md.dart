// contact_view_md.dart
import 'package:devpaul_co/core/validators/input_validators.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';
import 'package:devpaul_co/presentation/shared/collaborators_list_view.dart';
import 'package:devpaul_co/presentation/shared/custom_button.dart';
import 'package:devpaul_co/presentation/shared/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactViewMd extends StatefulWidget {
  final CollaboratorsProvider collaboratorsProvider;
  const ContactViewMd({Key? key, required this.collaboratorsProvider})
      : super(key: key);

  @override
  State<ContactViewMd> createState() => _ContactViewMdState();
}

class _ContactViewMdState extends State<ContactViewMd> {
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
      // Manejar el error de manera más amigable para el usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)!
                .could_not_launch_email)), // Asegúrate de definir esta clave en tus archivos de localización
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
                  child: CustomInput(
                    hintText: 'Full name',
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
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: CustomInput(
                    hintText: 'Email',
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
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: CustomInput(
                    hintText: 'Phone',
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
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: CustomInput(
                    hintText: 'Message',
                    controller: messageController,
                    validator: (value) =>
                        InputValidator.emptyValidator(value: value),
                    textInputType: TextInputType.multiline,
                    icon: Icons.message_outlined,
                    fontColor: const Color(0xff7B7E86),
                    borderColor: const Color(0xff2D69FD),
                    minLines: 4,
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
