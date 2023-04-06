import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  final int delay;

  const CustomMenuItem(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.delay})
      : super(key: key);

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 2000),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
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
                color:
                    isHover ? const Color(0xffAD54C2) : const Color(0xff002000),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class MobileMenuItem extends StatefulWidget {
  const MobileMenuItem({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final Function onPressed;
  @override
  State<MobileMenuItem> createState() => MobileMenuItemState();
}

class MobileMenuItemState extends State<MobileMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 2000),
      child: MouseRegion(
        onEnter: (_) => setState(() {
          isHover = true;
        }),
        onExit: (_) => setState(() {
          isHover = false;
        }),
        child: InkWell(
          onTap: () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  color: Colors.white70,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  widget.text,
                  style: GoogleFonts.inter(
                      color: isHover ? const Color(0xffAD54C2) : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
