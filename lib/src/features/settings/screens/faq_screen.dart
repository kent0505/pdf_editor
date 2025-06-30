import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  static const routePath = '/FaqScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'FAQ'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [],
      ),
    );
  }
}
