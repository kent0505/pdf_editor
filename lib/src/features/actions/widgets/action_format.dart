import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';

class ActionFormat extends StatelessWidget {
  const ActionFormat({
    super.key,
    required this.title,
    required this.format1,
    required this.format2,
    required this.onPressed,
  });

  final String title;
  final String format1;
  final String format2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final width = (w - 2 * 26 - 2 * 10) / 3;

    return Container(
      height: 74,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Button(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgWidget(
                    format1,
                    height: 22,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: SvgWidget(
                      Assets.right,
                      height: 6,
                    ),
                  ),
                  SvgWidget(
                    format2,
                    height: 22,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: AppFonts.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
