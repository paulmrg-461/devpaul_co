import 'package:flutter/material.dart';
import 'package:devpaul_co/domain/entities/collaborator_entity.dart';
import 'package:devpaul_co/domain/repositories/collaborator_repository.dart';

class CollaboratorsProvider extends ChangeNotifier {
  final CollaboratorRepository collaboratorRepository;

  bool initialLoading = true;
  List<CollaboratorEntity> collaborators = [];

  CollaboratorsProvider({required this.collaboratorRepository});

  void getCollaborators() {
    collaborators = collaboratorRepository.getCollaborators();
    initialLoading = false;
    notifyListeners();
  }
}
