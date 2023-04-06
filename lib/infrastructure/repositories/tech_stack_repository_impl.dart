import 'package:devpaul_co/domain/datasources/tech_stack_datasource.dart';
import 'package:devpaul_co/domain/entities/tech_stack_entity.dart';
import 'package:devpaul_co/domain/repositories/tech_stack_repository.dart';

class TechStackRepositoryImpl implements TechStackRepository {
  final TechStackDatasource techStackDatasource;

  TechStackRepositoryImpl({required this.techStackDatasource});

  @override
  List<TechStackEntity> getTechStack() => techStackDatasource.getTechStack();
}
