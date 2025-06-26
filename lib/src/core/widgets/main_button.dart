import 'package:flutter/material.dart';

import '../constants.dart';
import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.horizontal = 0,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final double horizontal;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: horizontal),
      decoration: BoxDecoration(
        color: active ? const Color(0xffE12426) : const Color(0xff808080),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Button(
        onPressed: active ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: AppFonts.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
