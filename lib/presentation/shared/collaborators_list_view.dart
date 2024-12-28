import 'dart:async';

import 'package:devpaul_co/domain/entities/collaborator_entity.dart';
import 'package:devpaul_co/presentation/shared/collaborator_card.dart';
import 'package:flutter/material.dart';

class CollaboratorsListView extends StatefulWidget {
  final List<CollaboratorEntity> collaborators;
  const CollaboratorsListView({super.key, required this.collaborators});

  @override
  State<CollaboratorsListView> createState() => _CollaboratorsListViewState();
}

class _CollaboratorsListViewState extends State<CollaboratorsListView> {
  late ScrollController _scrollController;
  late Timer _timer;
  bool _scrollForward = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 5), () {
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (_scrollForward) {
          if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent) {
            _scrollForward = false;
          } else {
            _scrollController.animateTo(
              _scrollController.offset + 5.0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
            );
          }
        } else {
          if (_scrollController.offset <=
              _scrollController.position.minScrollExtent) {
            _scrollForward = true;
          } else {
            _scrollController.animateTo(
              _scrollController.offset - 5.0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          width: 28,
        ),
        ...widget.collaborators
            .map((collaborator) => CollaboratorCard(
                  collaboratorEntity: collaborator,
                  width: 380,
                ))
            .toList(),
      ]),
    );
  }
}
