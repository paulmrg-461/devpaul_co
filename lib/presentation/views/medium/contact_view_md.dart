import 'package:devpaul_co/presentation/shared/custom_button.dart';
import 'package:devpaul_co/presentation/shared/custom_input.dart';
import 'package:devpaul_co/presentation/shared/dev_paul_vertical_logo.dart';
import 'package:devpaul_co/presentation/shared/team_colaborators_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactViewMd extends StatefulWidget {
  const ContactViewMd({Key? key}) : super(key: key);

  @override
  State<ContactViewMd> createState() => _ContactViewMdState();
}

class _ContactViewMdState extends State<ContactViewMd> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .contact_page_team_colaborators,
                    style: GoogleFonts.inter(
                        color: const Color(0xff232835),
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    margin: const EdgeInsets.only(top: 10, bottom: 6),
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
                  const TeamColaboratorsList(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomInput(
                              hintText: 'Full name',
                              textController: nameController,
                              icon: Icons.person_outline_outlined,
                              textInputType: TextInputType.name,
                              textCapitalization: TextCapitalization.sentences,
                              fontColor: const Color(0xff7B7E86),
                              borderColor: const Color(0xff2D69FD),
                            ),
                            CustomInput(
                              hintText: 'Email',
                              textController: emailController,
                              textInputType: TextInputType.emailAddress,
                              icon: Icons.email_outlined,
                              fontColor: const Color(0xff7B7E86),
                              borderColor: const Color(0xff2D69FD),
                            ),
                            CustomInput(
                              hintText: 'Phone',
                              textController: phoneController,
                              textInputType: TextInputType.phone,
                              icon: Icons.phone_outlined,
                              fontColor: const Color(0xff7B7E86),
                              borderColor: const Color(0xff2D69FD),
                            ),
                            CustomInput(
                              hintText: 'Message',
                              textController: phoneController,
                              textInputType: TextInputType.multiline,
                              icon: Icons.message_outlined,
                              fontColor: const Color(0xff7B7E86),
                              borderColor: const Color(0xff2D69FD),
                              // expands: true,
                              minLines: 6,
                              maxLines: 16,
                              borderRadius: 18,
                            ),
                            CustomButton(
                              text: AppLocalizations.of(context)!
                                  .home_page_menu_contact,
                              onPressed: () => print('Hola Amiguis'),
                              backgroundColor: Colors.transparent,
                              fontColor: const Color(0xff2D69FD),
                              buttonElevation: 0,
                              borderColor: const Color(0xff2D69FD),
                            ),
                          ],
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
      ),
    );
  }
}
