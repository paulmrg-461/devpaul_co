import 'package:animate_do/animate_do.dart';
import 'package:devpaul_co/domain/entities/tech_stack_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedAssetImage extends StatelessWidget {
  final TechStackEntity techStackEntity;
  final double heigth;
  final double width;
  final double paddingTop;

  const AnimatedAssetImage({
    Key? key,
    required this.techStackEntity,
    this.heigth = 90,
    this.width = 90,
    this.paddingTop = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
      duration: const Duration(milliseconds: 2000),
      from: 20,
      delay: Duration(milliseconds: techStackEntity.delay ?? 0),
      child: InkWell(
          onTap: () async {
            final Uri url = Uri.parse(techStackEntity.url);
            if (!await launchUrl(url)) {
              throw 'Could not launch $url';
            }
          },
          child: Container(
            padding: EdgeInsets.only(top: paddingTop),
            height: heigth,
            child: Image(image: AssetImage(techStackEntity.imagePath)),
          )),
    );
  }
}
