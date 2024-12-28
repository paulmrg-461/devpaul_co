import 'package:devpaul_co/domain/entities/collaborator_entity.dart';
import 'package:devpaul_co/presentation/shared/collaborator_card.dart';
import 'package:flutter/material.dart';

class CollaboratorsListView extends StatelessWidget {
  final List<CollaboratorEntity> collaborators;
  const CollaboratorsListView({super.key, required this.collaborators});

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
                  width: 380,
                ))
            .toList(),
      ]),
    );
  }
}
