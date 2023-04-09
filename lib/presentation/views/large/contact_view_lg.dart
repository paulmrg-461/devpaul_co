import 'package:devpaul_co/core/validators/input_validators.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';
import 'package:devpaul_co/presentation/shared/collaborators_list_view.dart';
import 'package:devpaul_co/presentation/shared/custom_button.dart';
import 'package:devpaul_co/presentation/shared/custom_input.dart';
import 'package:devpaul_co/presentation/shared/dev_paul_vertical_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactViewLg extends StatelessWidget {
  final CollaboratorsProvider collaboratorsProvider;
  const ContactViewLg({Key? key, required this.collaboratorsProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String name = '';
    String email = '';
    String cellphone = '';
    String message = '';

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28),
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
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: const EdgeInsets.only(top: 10, bottom: 6, left: 28),
                  child: Text(
                    """Laborum ipsum pariatur fugiat occaecat quis est et non occaecat sit. Aliqua laboris velit labore ut irure. Ex nostrud ad aliqua enim anim est.""",
                    style: GoogleFonts.inter(
                        color: const Color(0xff7B7E86),
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                CollaboratorsListView(
                  collaborators: collaboratorsProvider.collaborators,
                  width: size.width * 0.35,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            margin: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.contact_page_work_together,
                      style: GoogleFonts.inter(
                          color: const Color(0xff232835),
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: const EdgeInsets.only(top: 14, bottom: 36),
                      child: Text(
                        """Laborum ipsum pariatur fugiat occaecat quis est et non occaecat sit. Aliqua laboris velit labore ut irure. Ex nostrud ad aliqua enim anim est.""",
                        style: GoogleFonts.inter(
                            color: const Color(0xff7B7E86),
                            fontSize: 14,
                            fontWeight: FontWeight.w200),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                              validator: (value) =>
                                  InputValidator.emailValidator(value),
                              textInputType: TextInputType.emailAddress,
                              icon: Icons.email_outlined,
                              fontColor: const Color(0xff7B7E86),
                              borderColor: const Color(0xff2D69FD),
                            ),
                            CustomInput(
                              hintText: 'Phone',
                              onChanged: (value) => cellphone = value,
                              validator: (value) =>
                                  InputValidator.phoneValidator(value),
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
                              minLines: 4,
                              maxLines: 16,
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
                                if (!isValid) return;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 450,
                  height: 450,
                  padding: const EdgeInsets.all(60),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xff443357), Color(0xff394053)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xff443357).withAlpha(60),
                          blurRadius: 12.0,
                          spreadRadius: 7.0,
                          offset: const Offset(
                            10.0,
                            10.0,
                          ),
                        ),
                      ]),
                  child: const DevPaulVerticalLogo(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
