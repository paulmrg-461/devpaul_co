// import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  final List<String> _pages = ['Home', 'About', 'Contact', 'Location'];
  int _currentIndex = 0;

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

  goTo(int index) {
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
