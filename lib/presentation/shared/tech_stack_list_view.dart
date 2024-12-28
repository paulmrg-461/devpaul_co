import 'package:devpaul_co/domain/entities/tech_stack_entity.dart';
import 'package:devpaul_co/presentation/shared/animated_asset_image.dart';
import 'package:devpaul_co/presentation/shared/auto_scroll_listview.dart';
import 'package:flutter/material.dart';

class TechStackListView extends StatelessWidget {
  final List<TechStackEntity> techStackList;

  const TechStackListView({Key? key, required this.techStackList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoScrollListView(
      scrollDirection: Axis.horizontal,
      children: techStackList
          .map((techStack) => AnimatedAssetImage(techStackEntity: techStack))
          .toList(),
    );
  }
}
