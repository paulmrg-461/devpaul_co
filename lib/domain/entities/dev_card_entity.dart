import 'package:flutter/material.dart';

class DevCardEntity {
  final IconData icon;
  final String title;
  final String body;
  final String buttonText;
  final VoidCallback callback;
  final int? delay;

  DevCardEntity(
      {required this.icon,
      required this.title,
      required this.body,
      required this.buttonText,
      required this.callback,
      this.delay});
}
