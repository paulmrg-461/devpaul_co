import 'package:devpaul_co/domain/entities/tech_stack_entity.dart';
import 'package:devpaul_co/presentation/shared/animated_asset_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class TechStackListView extends StatefulWidget {
  final List<TechStackEntity> techStackList;
  const TechStackListView({super.key, required this.techStackList});

  @override
  _TechStackListViewState createState() => _TechStackListViewState();
}

class _TechStackListViewState extends State<TechStackListView> {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.techStackList
            .map((techStack) => AnimatedAssetImage(techStackEntity: techStack))
            .toList(),
      ),
    );
  }
}
