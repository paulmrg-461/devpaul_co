import 'package:devpaul_co/domain/datasources/tech_stack_datasource.dart';
import 'package:devpaul_co/domain/entities/tech_stack_entity.dart';
import 'package:devpaul_co/shared/data/local_tech_stack.dart';

class LocalTechStackDatasourceImpl implements TechStackDatasource {
  @override
  List<TechStackEntity> getTechStack() => localTechStackList
      .map((techStack) => TechStackEntity.fromJson(techStack))
      .toList();
}
