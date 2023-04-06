import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> menuItems =
        ['Home', 'About', 'View', 'More'].map((item) => Text(item)).toList();

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) => constraints.maxWidth > 520
          ? WebMenu(menuItems: menuItems)
          : MobileMenu(menuItems: menuItems),
    );
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

class WebMenu extends StatelessWidget {
  const WebMenu({
    super.key,
    required this.menuItems,
  });

  final List<Widget> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: menuItems,
    );
  }
}
