import 'package:devpaul_co/domain/datasources/collaborator_datasource.dart';
import 'package:devpaul_co/domain/entities/collaborator_entity.dart';
import 'package:devpaul_co/domain/repositories/collaborator_repository.dart';

class CollaboratorRepositoryImpl implements CollaboratorRepository {
  final CollaboratorDatasource collaboratorDatasource;

  CollaboratorRepositoryImpl({required this.collaboratorDatasource});

  @override
  List<CollaboratorEntity> getCollaborators() =>
      collaboratorDatasource.getCollaborators();
}
