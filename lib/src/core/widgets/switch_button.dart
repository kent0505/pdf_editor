import 'package:flutter/material.dart';

import 'button.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
    required this.isActive,
    required this.onPressed,
  });

  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 20,
        width: 38,
        decoration: BoxDecoration(
          color: const Color(0xff555555),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Button(
          onPressed: onPressed,
          minSize: 20,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                top: 1,
                left: isActive ? 19 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? const Color(0xff30D158) : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
