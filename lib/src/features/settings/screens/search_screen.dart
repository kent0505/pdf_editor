import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const routePath = '/SearchScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Search'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [],
      ),
    );
  }
}
