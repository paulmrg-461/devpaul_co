// import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  late AnimationController menuAnimationController;

  Animation<double> get animation => menuAnimationController;

  @override
  void dispose() {
    menuAnimationController.dispose();
    super.dispose();
  }

  PageController scrollController = PageController();
  final List<String> _pages = ['Home', 'About', 'Contact', 'Location'];
  int _currentIndex = 0;
  bool _menuIsOpen = false;

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
    scrollController.addListener(() {
      final int pageIndex = (scrollController.page ?? 0).round();
      if (pageIndex != _currentIndex) {
        html.window.history
            .pushState(null, 'none', '#/${_pages[pageIndex].toLowerCase()}');
        _currentIndex = pageIndex;
        html.document.title = _pages[pageIndex];
      }
    });
  }

  int getPageIndex(String routeName) =>
      (_pages.contains(routeName) ? _pages.indexOf(routeName) : 0);

  bool get menuIsOpen => _menuIsOpen;

  set menuIsOpen(bool menuIsOpen) {
    _menuIsOpen = menuIsOpen;
    notifyListeners();
  }

  goTo(int index) {
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    menuAnimationController.reverse();
    _menuIsOpen = false;
    notifyListeners();
  }
}
