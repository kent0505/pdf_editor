import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/svg_widget.dart';
import 'settings_divider.dart';

class SettingsOtherApps extends StatelessWidget {
  const SettingsOtherApps({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
  });

  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _AppTile(
            asset: Assets.app1,
            title: 'Office 7',
            description:
                'Download office 7 and edit .doc, .xls & .ppt documents',
            onPressed: onPressed1,
          ),
          const SettingsDivider(),
          _AppTile(
            asset: Assets.app2,
            title: 'PDF 7 for Mac',
            description: 'Download PDF Editor for Mac',
            onPressed: onPressed2,
          ),
        ],
      ),
    );
  }
}

class _AppTile extends StatelessWidget {
  const _AppTile({
    required this.asset,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  final String asset;
  final String title;
  final String description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Button(
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 16),
            ImageWidget(
              asset,
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: AppFonts.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.5),
                      fontSize: 10,
                      fontFamily: AppFonts.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SvgWidget(Assets.right),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
