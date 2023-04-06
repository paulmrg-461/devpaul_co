import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItemFooter extends StatefulWidget {
  final String text;
  final Function onPressed;

  const CustomMenuItemFooter({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomMenuItemFooter> createState() => _CustomMenuItemStateFooter();
}

class _CustomMenuItemStateFooter extends State<CustomMenuItemFooter> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        isHover = true;
      }),
      onExit: (_) => setState(() {
        isHover = false;
      }),
      child: InkWell(
        onTap: () => widget.onPressed(),
        child: Text(
          widget.text,
          style: GoogleFonts.inter(
            color: isHover ? const Color(0xff2D69FD) : const Color(0xff9EA7AD),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
