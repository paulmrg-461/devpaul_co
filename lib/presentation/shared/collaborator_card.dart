import 'package:devpaul_co/domain/entities/collaborator_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CollaboratorCard extends StatelessWidget {
  final CollaboratorEntity collaboratorEntity;
  final double width;
  const CollaboratorCard(
      {super.key, required this.collaboratorEntity, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff2D69FD)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            margin: const EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
                color: Colors.blue,
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
                    color: const Color(0xff232835),
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
                      size: 14,
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
                    size: 14,
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
    );
  }
}
