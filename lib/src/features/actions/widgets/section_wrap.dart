import 'package:flutter/material.dart';

class SectionWrap extends StatelessWidget {
  const SectionWrap({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: children,
    );
  }
}
