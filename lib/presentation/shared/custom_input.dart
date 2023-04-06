import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;
  final TextEditingController? textController;
  final IconData? icon;
  final bool passwordVisibility;
  final TextInputType textInputType;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final bool enabledInputInteraction;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? fontColor;
  final int? minLines;
  final int? maxLines;
  final bool? expands;

  const CustomInput({
    Key? key,
    @required this.hintText,
    @required this.textController,
    @required this.icon,
    this.passwordVisibility = false,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.enabledInputInteraction = true,
    this.textCapitalization = TextCapitalization.none,
    this.borderRadius = 36,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.blue,
    this.fontColor = Colors.black54,
    this.minLines = 1,
    this.maxLines = 1,
    this.expands = false,
  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool passwordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 14),
        //padding: EdgeInsets.only(top: 6, left: 6, right: 18),
        decoration: BoxDecoration(
          color: widget.backgroundColor!,
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        child: TextField(
          minLines: widget.minLines!,
          maxLines: widget.maxLines!,
          expands: widget.expands!,
          style: GoogleFonts.inter(
              color: widget.fontColor!,
              fontSize: 14,
              fontWeight: FontWeight.w200),
          controller: widget.textController,
          autocorrect: false,
          keyboardType: widget.textInputType,
          obscureText: (widget.obscureText && passwordObscure) ? true : false,
          enabled: widget.enabledInputInteraction,
          textCapitalization: widget.textCapitalization,
          decoration: InputDecoration(
              isCollapsed: true,
              prefixIcon: Icon(
                widget.icon,
                color: widget.borderColor,
              ),
              suffixIcon: widget.passwordVisibility
                  ? IconButton(
                      color: widget.borderColor,
                      icon: Icon(passwordObscure
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => setState(() {
                        passwordObscure = !passwordObscure;
                      }),
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius!),
                borderSide: BorderSide(color: widget.borderColor!, width: 1.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius!),
                borderSide: BorderSide(
                    color: const Color(0xff7B7E86).withOpacity(0.5),
                    width: 1.5),
              ),
              //hintText: this.hintText,
              labelText: widget.hintText,
              labelStyle: TextStyle(color: widget.fontColor!)),
        ));
  }
}
