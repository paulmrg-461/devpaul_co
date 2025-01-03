// lib/presentation/shared/contact_form.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:devpaul_co/core/validators/input_validators.dart';
import 'custom_input.dart';
import 'custom_button.dart';

class ContactForm extends StatefulWidget {
  final double width; // Ancho del formulario para adaptabilidad
  const ContactForm({Key? key, required this.width}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cellphoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    // Dispose de los controladores para evitar fugas de memoria
    _nameController.dispose();
    _emailController.dispose();
    _cellphoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String cellphone = _cellphoneController.text.trim();
    final String message = _messageController.text.trim();

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInput(
            hintText: AppLocalizations.of(context)!.contact_page_form_fullname,
            controller: _nameController,
            validator: (value) => InputValidator.emptyValidator(value: value),
            textInputType: TextInputType.name,
            icon: Icons.person_outline_outlined,
            textCapitalization: TextCapitalization.sentences,
            fontColor: const Color(0xff7B7E86),
            borderColor: const Color(0xff2D69FD),
            obscureText: false,
            enabledInputInteraction: true,
          ),
          CustomInput(
            hintText: AppLocalizations.of(context)!.contact_page_form_email,
            controller: _emailController,
            validator: (value) => InputValidator.emailValidator(value),
            textInputType: TextInputType.emailAddress,
            icon: Icons.email_outlined,
            fontColor: const Color(0xff7B7E86),
            borderColor: const Color(0xff2D69FD),
            obscureText: false,
            enabledInputInteraction: true,
          ),
          CustomInput(
            hintText: AppLocalizations.of(context)!.contact_page_form_phone,
            controller: _cellphoneController,
            validator: (value) => InputValidator.phoneValidator(value),
            textInputType: TextInputType.phone,
            icon: Icons.phone_outlined,
            fontColor: const Color(0xff7B7E86),
            borderColor: const Color(0xff2D69FD),
            obscureText: false,
            enabledInputInteraction: true,
          ),
          CustomInput(
            hintText: AppLocalizations.of(context)!.contact_page_form_message,
            controller: _messageController,
            validator: (value) => InputValidator.emptyValidator(value: value),
            textInputType: TextInputType.multiline,
            icon: Icons.message_outlined,
            fontColor: const Color(0xff7B7E86),
            borderColor: const Color(0xff2D69FD),
            minLines: 4,
            maxLines: 16,
            obscureText: false,
            enabledInputInteraction: true,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: AppLocalizations.of(context)!.home_page_menu_contact,
            backgroundColor: Colors.transparent,
            fontColor: const Color(0xff2D69FD),
            buttonElevation: 0,
            borderColor: const Color(0xff2D69FD),
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
                _sendEmail();
              }
            },
          ),
        ],
      ),
    );
  }
}
