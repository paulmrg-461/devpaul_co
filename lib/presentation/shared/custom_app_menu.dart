import 'package:devpaul_co/presentation/shared/dev_paul_horizontal_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:devpaul_co/presentation/shared/custom_menu_item.dart';
import 'package:devpaul_co/presentation/providers/page_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;
  int delay = 30;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);

    final List<String> menuStrings = [
      AppLocalizations.of(context)!.home_page_menu_home,
      AppLocalizations.of(context)!.home_page_menu_about,
      AppLocalizations.of(context)!.home_page_menu_contact,
      AppLocalizations.of(context)!.home_page_menu_location,
      AppLocalizations.of(context)!.home_page_resume,
    ];

    final List<IconData> icons = [
      Icons.home_outlined,
      Icons.info_outline,
      Icons.phone_outlined,
      Icons.location_on_outlined,
      Icons.account_circle_outlined
    ];

    final List<Widget> customMenuItems = menuStrings
        .asMap()
        .entries
        .map((item) => Column(
              children: [
                const Divider(
                  color: Colors.white70,
                  thickness: 0.25,
                ),
                MobileMenuItem(
                  text: item.value,
                  onPressed: () => item.key == 4
                      ? launchUrl(Uri.parse(
                          'https://drive.google.com/file/d/1jAPgDvxwXu2IE-Gcje66cQ8SGfgz1lmf/view?usp=sharing'))
                      : pageProvider.goTo(item.key),
                  icon: icons[item.key],
                  delay: (delay * (item.key * 4)),
                ),
              ],
            ))
        .toList();

    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: () => setState(() {
        isOpen ? controller.reverse() : controller.forward();
        isOpen = !isOpen;
      }),
      child: Container(
        width: size.width,
        height: isOpen ? size.height * 0.5 : null,
        decoration: const BoxDecoration(
            color: Color(0xff443357),
            gradient: RadialGradient(
              center: Alignment.bottomLeft,
              radius: 1,
              colors: [Color(0xff443357), Color(0xff1F2631)],
            )),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _MenuTitle(isOpen: isOpen, controller: controller),
            if (isOpen) ...customMenuItems,
            SizedBox(
              height: isOpen ? 16 : 0,
            )
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const DevPaulHorizontalLogo(),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white)),
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            size: 32,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}