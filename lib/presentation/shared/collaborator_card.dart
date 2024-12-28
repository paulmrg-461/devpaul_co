import 'package:animate_do/animate_do.dart';
import 'package:devpaul_co/domain/entities/collaborator_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CollaboratorCard extends StatelessWidget {
  final CollaboratorEntity collaboratorEntity;
  final double width;
  const CollaboratorCard(
      {super.key, required this.collaboratorEntity, required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(
            "whatsapp://send?phone=${collaboratorEntity.phone}&text=Hola ${collaboratorEntity.name}");

        if (!await launchUrl(url)) {
          throw 'Could not launch $url';
        }
      },
      child: BounceInLeft(
        duration: const Duration(milliseconds: 2000),
        delay: Duration(milliseconds: collaboratorEntity.delay),
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xff011D2B).withOpacity(0.4)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    color: const Color(0xff011D2B),
                    border:
                        Border.all(color: const Color(0xff011D2B), width: 1.5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(collaboratorEntity.imagePath))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collaboratorEntity.name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: const Color(0xff011D2B),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    collaboratorEntity.profession,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: const Color(0xff7B7E86),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 4),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 15,
                          color: Color(0xff2D69FD),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          collaboratorEntity.email,
                          style: GoogleFonts.inter(
                              color: const Color(0xff7B7E86),
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 15,
                        color: Color(0xff2D69FD),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        collaboratorEntity.phone,
                        style: GoogleFonts.inter(
                            color: const Color(0xff7B7E86),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
