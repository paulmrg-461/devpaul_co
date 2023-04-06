import 'package:devpaul_co/domain/entities/tech_stack_entity.dart';

abstract class TechStackRepository {
  List<TechStackEntity> getTechStack();
}
