import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamColaboratorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String profession;
  final String email;
  final String phone;
  final int delay;
  const TeamColaboratorCard(
      {super.key,
      required this.name,
      required this.profession,
      required this.email,
      required this.phone,
      required this.imagePath,
      required this.delay});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 2000),
      delay: Duration(milliseconds: delay),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            margin: const EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$imagePath'))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.inter(
                    color: const Color(0xff232835),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                profession,
                style: GoogleFonts.inter(
                    color: const Color(0xff7B7E86),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 16,
                      color: Color(0xff2D69FD),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      email,
                      style: GoogleFonts.inter(
                          color: const Color(0xff7B7E86),
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.read_more,
                    size: 16,
                    color: Color(0xff2D69FD),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    phone,
                    style: GoogleFonts.inter(
                        color: const Color(0xff7B7E86),
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
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
