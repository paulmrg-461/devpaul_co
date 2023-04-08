import 'package:devpaul_co/domain/datasources/collaborator_datasource.dart';
import 'package:devpaul_co/domain/entities/collaborator_entity.dart';
import 'package:devpaul_co/shared/data/local_collaborators.dart';

class LocalCollaboratorDatasourceImpl implements CollaboratorDatasource {
  @override
  List<CollaboratorEntity> getCollaborators() => localCollaborators
      .map((collaborator) => CollaboratorEntity.fromJson(collaborator))
      .toList();
}
