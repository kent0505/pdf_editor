import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class ActionTitle extends StatelessWidget {
  const ActionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 14,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: AppFonts.w500,
        ),
      ),
    );
  }
}
