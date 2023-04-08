import 'package:devpaul_co/domain/entities/tech_stack_entity.dart';
import 'package:devpaul_co/domain/repositories/tech_stack_repository.dart';
import 'package:flutter/material.dart';

class TechStackProvider extends ChangeNotifier {
  final TechStackRepository techStackRepository;

  bool initialLoading = true;
  List<TechStackEntity> techStackList = [];

  TechStackProvider({required this.techStackRepository});

  void getTechStack() {
    techStackList = techStackRepository.getTechStack();
    initialLoading = false;
    notifyListeners();
  }
}
