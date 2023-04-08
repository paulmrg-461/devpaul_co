import 'package:devpaul_co/domain/entities/collaborator_entity.dart';

abstract class CollaboratorRepository {
  List<CollaboratorEntity> getCollaborators();
}
