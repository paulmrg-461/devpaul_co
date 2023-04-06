import 'package:flutter/material.dart';

class MainLayoutLg extends StatelessWidget {
  const MainLayoutLg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [Text('Tola'), Expanded(child: Text('Screen'))],
      ),
    );
  }
}
