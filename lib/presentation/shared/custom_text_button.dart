import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final VoidCallback? callback;
  const CustomTextButton({
    Key? key,
    required this.title,
    required this.callback,
    this.color = Colors.deepPurple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(primary: color),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(title!,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        ));
  }
}
