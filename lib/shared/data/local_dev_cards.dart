import 'package:devpaul_co/presentation/shared/custom_mobile_dev_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:devpaul_co/domain/entities/dev_card_entity.dart';

class LocalDevCards extends StatelessWidget {
  final double? width;
  final double? height;
  const LocalDevCards({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<DevCardEntity> localDevCards = [
      DevCardEntity(
          icon: Icons.phone_android_rounded,
          title: AppLocalizations.of(context)!.about_page_mobile_dev_card,
          body:
              'Occaecat id Lorem reprehenderit nulla aliqua ex tempor incididunt. Ea aliqua incididunt sint Lorem non sunt culpa nisi incididunt commodo.',
          buttonText: 'See more',
          callback: () => print('Mobile development'),
          delay: 100),
      DevCardEntity(
          icon: Icons.web_asset_rounded,
          title: AppLocalizations.of(context)!.about_page_web_dev_card,
          body:
              'Occaecat id Lorem reprehenderit nulla aliqua ex tempor incididunt. Ea aliqua incididunt sint Lorem non sunt culpa nisi incididunt commodo.',
          buttonText: 'See more',
          callback: () => print('Web development'),
          delay: 300),
      DevCardEntity(
          icon: Icons.devices_other_rounded,
          title: AppLocalizations.of(context)!.about_page_backend_dev_card,
          body:
              'Occaecat id Lorem reprehenderit nulla aliqua ex tempor incididunt. Ea aliqua incididunt sint Lorem non sunt culpa nisi incididunt commodo.',
          buttonText: 'See more',
          callback: () => print('Backend development'),
          delay: 600),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(children: [
        const SizedBox(
          width: 28,
        ),
        ...localDevCards
            .map((devCard) => CustomMobileDevCard(
                devCardEntity: devCard,
                width: width ?? size.width * 0.6,
                height: height ?? size.height * 0.4))
            .toList(),
      ]),
    );
  }
}
