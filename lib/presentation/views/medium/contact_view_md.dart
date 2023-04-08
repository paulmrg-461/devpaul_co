import 'package:devpaul_co/core/validators/input_validators.dart';
import 'package:devpaul_co/presentation/shared/custom_button.dart';
import 'package:devpaul_co/presentation/shared/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactViewMd extends StatelessWidget {
  const ContactViewMd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String name = '';
    String email = '';
    String cellphone = '';
    String message = '';

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: MediaQuery.of(context).size.height * 0.11),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.contact_page_work_together,
                style: GoogleFonts.inter(
                    color: const Color(0xff232835),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                // width: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.only(top: 14, bottom: 26),
                child: Text(
                  """Laborum ipsum pariatur fugiat occaecat quis est et non occaecat sit. Aliqua laboris velit labore ut irure. Ex nostrud ad aliqua enim anim est.""",
                  style: GoogleFonts.inter(
                      color: const Color(0xff7B7E86),
                      fontSize: 14,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.justify,
                ),
              ),
              CustomInput(
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
              CustomInput(
                hintText: 'Email',
                onChanged: (value) => email = value,
                validator: (value) => InputValidator.emailValidator(value),
                textInputType: TextInputType.emailAddress,
                icon: Icons.email_outlined,
                fontColor: const Color(0xff7B7E86),
                borderColor: const Color(0xff2D69FD),
              ),
              CustomInput(
                hintText: 'Phone',
                onChanged: (value) => cellphone = value,
                validator: (value) => InputValidator.phoneValidator(value),
                textInputType: TextInputType.phone,
                icon: Icons.phone_outlined,
                fontColor: const Color(0xff7B7E86),
                borderColor: const Color(0xff2D69FD),
              ),
              CustomInput(
                hintText: 'Message',
                onChanged: (value) => message = value,
                validator: (value) =>
                    InputValidator.emptyValidator(value: value),
                textInputType: TextInputType.multiline,
                icon: Icons.message_outlined,
                fontColor: const Color(0xff7B7E86),
                borderColor: const Color(0xff2D69FD),
                // expands: true,
                minLines: 6,
                maxLines: 16,
              ),
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
        ),
      ),
    );
  }
}
