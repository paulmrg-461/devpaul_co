import 'package:devpaul_co/domain/entities/tech_stack_entity.dart';
import 'package:devpaul_co/presentation/shared/animated_asset_image.dart';
import 'package:flutter/material.dart';

class TechStackListView extends StatelessWidget {
  final List<TechStackEntity> techStackList;
  const TechStackListView({super.key, required this.techStackList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: techStackList
            .map((techStack) => AnimatedAssetImage(techStackEntity: techStack))
            .toList(),
      ),
    );
  }
}
