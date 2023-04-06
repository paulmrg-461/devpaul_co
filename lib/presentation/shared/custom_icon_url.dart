import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconUrl extends StatefulWidget {
  final String path;
  final String label;
  final double width;
  final double height;
  final Function onPressed;

  const CustomIconUrl({
    Key? key,
    required this.path,
    required this.onPressed,
    required this.label,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<CustomIconUrl> createState() => _CustomIconUrl();
}

class _CustomIconUrl extends State<CustomIconUrl> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final SvgPicture svgPicture = SvgPicture.asset(
      widget.path,
      semanticsLabel: widget.label,
      width: widget.width,
      height: widget.height,
    );
    return MouseRegion(
      onEnter: (_) => setState(() {
        isHover = true;
      }),
      onExit: (_) => setState(() {
        isHover = false;
      }),
      child: InkWell(
          onTap: () => widget.onPressed(),
          child: isHover
              ? Stack(
                  children: [
                    Container(
                      width: widget.width,
                      height: widget.height,
                      decoration: BoxDecoration(
                        color: const Color(0xffAD54C2).withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffAD54C2).withOpacity(0.15),
                            offset: const Offset(
                              2.5,
                              2.5,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: const Color(0xffAD54C2).withOpacity(0.4),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    svgPicture
                  ],
                )
              : svgPicture),
    );
  }
}
