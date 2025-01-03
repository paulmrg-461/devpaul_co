import 'package:devpaul_co/presentation/providers/providers.dart';
import 'package:devpaul_co/presentation/shared/custom_app_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devpaul_co/presentation/views/views.dart';

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
