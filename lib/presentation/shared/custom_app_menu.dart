import 'package:devpaul_co/presentation/providers/page_provider.dart';
import 'package:devpaul_co/presentation/shared/custom_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: () => setState(() {
        isOpen ? controller.reverse() : controller.forward();
        isOpen = !isOpen;
      }),
      child: Container(
        width: 160,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _MenuTitle(isOpen: isOpen, controller: controller),
            if (isOpen) ...[
              CustomMenuItem(
                  delay: 0,
                  // icon: Icons.home_outlined,
                  text: 'Home',
                  onPressed: () => pageProvider.goTo(0)),
              CustomMenuItem(
                  delay: 100,
                  // icon: Icons.info_outline,
                  text: 'About',
                  onPressed: () => pageProvider.goTo(1)),
              CustomMenuItem(
                  delay: 200,
                  // icon: Icons.monetization_on_outlined,
                  text: 'Pricing',
                  onPressed: () => pageProvider.goTo(2)),
              CustomMenuItem(
                  delay: 300,
                  // icon: Icons.handshake_outlined,
                  text: 'Contact',
                  onPressed: () => pageProvider.goTo(3)),
              CustomMenuItem(
                  delay: 400,
                  // icon: Icons.location_on_outlined,
                  text: 'Location',
                  onPressed: () => pageProvider.goTo(4))
            ],
          ],
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: isOpen ? 40 : 0,
        ),
        Text(
          'Menu',
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
        ),
        const Spacer(),
        AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: controller,
          color: Colors.white,
        ),
      ],
    );
  }
}
