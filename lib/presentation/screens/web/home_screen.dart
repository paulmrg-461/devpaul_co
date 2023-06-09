import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';
import 'package:devpaul_co/presentation/views/medium/contact_view_md.dart';
import 'package:devpaul_co/presentation/views/small/contact_view_sm.dart';
import 'package:devpaul_co/presentation/views/medium/about_view_md.dart';
import 'package:devpaul_co/presentation/views/medium/home_view_md.dart';
import 'package:devpaul_co/presentation/views/medium/location_view_md.dart';
import 'package:devpaul_co/presentation/providers/page_provider.dart';
import 'package:devpaul_co/presentation/providers/tech_stack_provider.dart';
import 'package:devpaul_co/presentation/shared/custom_app_menu.dart';
import 'package:devpaul_co/presentation/views/large/about_view_lg.dart';
import 'package:devpaul_co/presentation/views/large/contact_view_lg.dart';
import 'package:devpaul_co/presentation/views/large/home_view_lg.dart';
import 'package:devpaul_co/presentation/views/large/location_view_lg.dart';
import 'package:devpaul_co/presentation/views/small/about_view_sm.dart';
import 'package:devpaul_co/presentation/views/small/home_view_sm.dart';
import 'package:devpaul_co/presentation/views/small/location_view_sm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: const _HomeBody(),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff443357), Color(0xff394053)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ));
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    final TechStackProvider techStackProvider =
        context.watch<TechStackProvider>();
    final CollaboratorsProvider collaboratorsProvider =
        context.watch<CollaboratorsProvider>();

    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      List<Widget> pageViewList = [
        HomeViewLg(
            pageProvider: pageProvider, techStackProvider: techStackProvider),
        const AboutViewLg(),
        ContactViewLg(collaboratorsProvider: collaboratorsProvider),
        LocationViewLg(
          pageProvider: pageProvider,
        ),
      ];

      if (constraints.maxWidth <= 800) {
        pageViewList = [
          HomeViewSm(
              pageProvider: pageProvider, techStackProvider: techStackProvider),
          const AboutViewSm(),
          ContactViewSm(collaboratorsProvider: collaboratorsProvider),
          LocationViewSm(
            pageProvider: pageProvider,
          ),
        ];
      }

      if (constraints.maxWidth > 800 && constraints.maxWidth < 1100) {
        pageViewList = [
          HomeViewMd(
              pageProvider: pageProvider, techStackProvider: techStackProvider),
          const AboutViewMd(),
          ContactViewMd(collaboratorsProvider: collaboratorsProvider),
          LocationViewMd(
            pageProvider: pageProvider,
          ),
        ];
      }

      return Stack(
        children: [
          PageView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              controller: pageProvider.scrollController,
              pageSnapping: constraints.maxWidth > 1100 ? false : true,
              children: pageViewList),
          constraints.maxWidth > 1100
              ? const SizedBox()
              : const Positioned(top: 0, child: CustomAppMenu()),
        ],
      );
    });
  }
}
