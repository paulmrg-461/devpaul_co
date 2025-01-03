import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:devpaul_co/domain/entities/dev_card_entity.dart';
import 'package:devpaul_co/presentation/shared/custom_button.dart';

class CustomMobileDevCard extends StatelessWidget {
  final DevCardEntity devCardEntity;
  final double width;
  final double height;

  final double? margin;
  const CustomMobileDevCard(
      {Key? key,
      required this.devCardEntity,
      required this.width,
      required this.height,
      this.margin = 28})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 2000),
      delay: Duration(milliseconds: devCardEntity.delay ?? 0),
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(right: margin!),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xff443357), Color(0xff394053)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff2D69FD),
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: const Color(0xff2D69FD).withAlpha(60),
                            blurRadius: 14.0,
                            spreadRadius: 5,
                            offset: const Offset(
                              5,
                              5,
                            ),
                          ),
                        ]),
                    padding: const EdgeInsets.all(14),
                    child: Icon(
                      devCardEntity.icon,
                      color: Colors.white,
                      size: 40,
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      devCardEntity.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.inter(
                          color: const Color(0xffF2F0F6),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                devCardEntity.body,
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(
                    color: const Color(0xffF2F0F6),
                    fontSize: 14,
                    fontWeight: FontWeight.w200),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: devCardEntity.buttonText,
              onPressed: devCardEntity.callback,
              backgroundColor: Colors.transparent,
              buttonElevation: 0,
              internalVerticalPadding: 8,
              borderColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
