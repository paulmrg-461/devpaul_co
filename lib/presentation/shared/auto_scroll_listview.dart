// auto_scroll_list_view.dart
import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollListView extends StatefulWidget {
  final List<Widget> children;
  final Axis scrollDirection;
  final Duration initialDelay;
  final Duration scrollInterval;
  final double scrollAmount;
  final bool bounce;

  const AutoScrollListView({
    Key? key,
    required this.children,
    this.scrollDirection = Axis.horizontal,
    this.initialDelay = const Duration(seconds: 5),
    this.scrollInterval = const Duration(milliseconds: 70),
    this.scrollAmount = 5,
    this.bounce = true,
  }) : super(key: key);

  @override
  _AutoScrollListViewState createState() => _AutoScrollListViewState();
}

class _AutoScrollListViewState extends State<AutoScrollListView> {
  late ScrollController _scrollController;
  Timer? _timer;
  bool _scrollForward = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Iniciar el auto-desplazamiento después de que el widget haya sido renderizado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    // Iniciar el auto-desplazamiento después de un retraso inicial
    _timer = Timer(widget.initialDelay, () {
      _timer = Timer.periodic(widget.scrollInterval, (timer) {
        if (!_scrollController.hasClients) {
          // Si el controlador no está adjunto, no hacer nada
          return;
        }

        if (_scrollForward) {
          if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent) {
            _scrollForward = false;
          } else {
            _scrollController.jumpTo(
              _scrollController.offset + widget.scrollAmount,
            );
          }
        } else {
          if (_scrollController.offset <=
              _scrollController.position.minScrollExtent) {
            _scrollForward = true;
          } else {
            _scrollController.jumpTo(
              _scrollController.offset - widget.scrollAmount,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: widget.scrollDirection,
      physics: widget.bounce
          ? const BouncingScrollPhysics()
          : const ClampingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.children,
      ),
    );
  }
}
