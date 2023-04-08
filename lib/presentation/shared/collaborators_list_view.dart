import 'package:devpaul_co/domain/entities/collaborator_entity.dart';
import 'package:devpaul_co/presentation/shared/collaborator_card.dart';
import 'package:flutter/material.dart';

class CollaboratorsListView extends StatelessWidget {
  final List<CollaboratorEntity> collaborators;
  final double width;
  const CollaboratorsListView(
      {super.key, required this.collaborators, required this.width});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          width: 28,
        ),
        ...collaborators
            .map((collaborator) => CollaboratorCard(
                  collaboratorEntity: collaborator,
                  width: width,
                ))
            .toList(),
      ]),
    );

    // return SizedBox(
    //   height: 230,
    //   child: ListView.builder(
    //     shrinkWrap: true,
    //     scrollDirection: Axis.horizontal,
    //     itemCount: collaborators.length,
    //     itemBuilder: (context, index) {
    //       final collaboratorEntity collaboratorEntity = collaborators[index];
    //       return AnimatedAssetImage(
    //         collaboratorEntity: collaboratorEntity,
    //       );
    //     },
    //   ),
    // );
  }
}
