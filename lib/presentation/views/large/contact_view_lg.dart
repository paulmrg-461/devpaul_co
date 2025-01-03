import 'package:devpaul_co/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:devpaul_co/core/validators/input_validators.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';

class ContactViewLg extends StatefulWidget {
  final CollaboratorsProvider collaboratorsProvider;
  const ContactViewLg({Key? key, required this.collaboratorsProvider})
      : super(key: key);

  @override
  _ContactViewLgState createState() => _ContactViewLgState();
}

class _ContactViewLgState extends State<ContactViewLg> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    collaborators: widget.collaboratorsProvider.collaborators,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(),
                  ),
                ],
              ),
            ),
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
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomInput(
                                  hintText: 'Full name',
                                  controller: nameController,
                                  validator: (value) =>
                                      InputValidator.emptyValidator(
                                          value: value),
                                  textInputType: TextInputType.name,
                                  icon: Icons.person_outline_outlined,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  fontColor: const Color(0xff7B7E86),
                                  borderColor: const Color(0xff2D69FD),
                                  obscureText: false,
                                  enabledInputInteraction: true,
                                ),
                                CustomInput(
                                  hintText: 'Email',
                                  controller: emailController,
                                  validator: (value) =>
                                      InputValidator.emailValidator(value),
                                  textInputType: TextInputType.emailAddress,
                                  icon: Icons.email_outlined,
                                  fontColor: const Color(0xff7B7E86),
                                  borderColor: const Color(0xff2D69FD),
                                  obscureText: false,
                                  enabledInputInteraction: true,
                                ),
                                CustomInput(
                                  hintText: 'Phone',
                                  controller: cellphoneController,
                                  validator: (value) =>
                                      InputValidator.phoneValidator(value),
                                  textInputType: TextInputType.phone,
                                  icon: Icons.phone_outlined,
                                  fontColor: const Color(0xff7B7E86),
                                  borderColor: const Color(0xff2D69FD),
                                  obscureText: false,
                                  enabledInputInteraction: true,
                                ),
                                CustomInput(
                                  hintText: 'Message',
                                  controller: messageController,
                                  validator: (value) =>
                                      InputValidator.emptyValidator(
                                          value: value),
                                  textInputType: TextInputType.multiline,
                                  icon: Icons.message_outlined,
                                  fontColor: const Color(0xff7B7E86),
                                  borderColor: const Color(0xff2D69FD),
                                  minLines: 6,
                                  maxLines: 16,
                                  obscureText: false,
                                  enabledInputInteraction: true,
                                ),
                                CustomButton(
                                  text: AppLocalizations.of(context)!
                                      .home_page_menu_contact,
                                  backgroundColor: Colors.transparent,
                                  fontColor: const Color(0xff2D69FD),
                                  buttonElevation: 0,
                                  borderColor: const Color(0xff2D69FD),
                                  onPressed: () {
                                    final isValid =
                                        formKey.currentState!.validate();
                                    if (isValid) {
                                      _sendEmail();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
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
