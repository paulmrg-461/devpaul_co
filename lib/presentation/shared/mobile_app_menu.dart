import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> menuItems =
        ['Home', 'About', 'View', 'More'].map((item) => Text(item)).toList();

    return MobileMenu(menuItems: menuItems);
  }
}

class MobileMenu extends StatelessWidget {
  const MobileMenu({
    super.key,
    required this.menuItems,
  });

  final List<Widget> menuItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: menuItems,
    );
  }
}
