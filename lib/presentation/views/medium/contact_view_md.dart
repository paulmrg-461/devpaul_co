import 'package:devpaul_co/core/validators/input_validators.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';
import 'package:devpaul_co/presentation/shared/collaborators_list_view.dart';
import 'package:devpaul_co/presentation/shared/custom_button.dart';
import 'package:devpaul_co/presentation/shared/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactViewMd extends StatefulWidget {
  final CollaboratorsProvider collaboratorsProvider;
  const ContactViewMd({Key? key, required this.collaboratorsProvider})
      : super(key: key);

  @override
  State<ContactViewMd> createState() => _ContactViewMdState();
}

String name = '';
String email = '';
String cellphone = '';
String message = '';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _ContactViewMdState extends State<ContactViewMd> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: size.height * 0.065, top: size.height * 0.11),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
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
              Padding(
                // width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.only(
                    top: 14, bottom: 26, left: 28, right: 28),
                child: Text(
                  AppLocalizations.of(context)!.contact_page_work_together_body,
                  style: GoogleFonts.inter(
                      color: const Color(0xff7B7E86),
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: CustomInput(
                  hintText: 'Full name',
                  onChanged: (value) => name = value,
                  validator: (value) =>
                      InputValidator.emptyValidator(value: value),
                  textInputType: TextInputType.name,
                  icon: Icons.person_outline_outlined,
                  textCapitalization: TextCapitalization.sentences,
                  fontColor: const Color(0xff7B7E86),
                  borderColor: const Color(0xff2D69FD),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: CustomInput(
                  hintText: 'Email',
                  onChanged: (value) => email = value,
                  validator: (value) => InputValidator.emailValidator(value),
                  textInputType: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  fontColor: const Color(0xff7B7E86),
                  borderColor: const Color(0xff2D69FD),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: CustomInput(
                  hintText: 'Phone',
                  onChanged: (value) => cellphone = value,
                  validator: (value) => InputValidator.phoneValidator(value),
                  textInputType: TextInputType.phone,
                  icon: Icons.phone_outlined,
                  fontColor: const Color(0xff7B7E86),
                  borderColor: const Color(0xff2D69FD),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: CustomInput(
                  hintText: 'Message',
                  onChanged: (value) => message = value,
                  validator: (value) =>
                      InputValidator.emptyValidator(value: value),
                  textInputType: TextInputType.multiline,
                  icon: Icons.message_outlined,
                  fontColor: const Color(0xff7B7E86),
                  borderColor: const Color(0xff2D69FD),
                  // expands: true,
                  minLines: 4,
                  maxLines: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: AppLocalizations.of(context)!.home_page_menu_contact,
                    backgroundColor: Colors.transparent,
                    fontColor: const Color(0xff2D69FD),
                    buttonElevation: 0,
                    borderColor: const Color(0xff2D69FD),
                    onPressed: () {
                      final isValid = formKey.currentState!.validate();
                      if (!isValid) return;
                    },
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text(
                  AppLocalizations.of(context)!.contact_page_team_colaborators,
                  style: GoogleFonts.inter(
                      color: const Color(0xff232835),
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                // width: MediaQuery.of(context).size.width * 0.4,
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
    );
  }
}
