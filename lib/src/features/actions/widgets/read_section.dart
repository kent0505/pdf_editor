import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../screens/read_screen.dart';
import 'action_card.dart';
import 'section_wrap.dart';

class ReadSection extends StatelessWidget {
  const ReadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      children: [
        ActionCard(
          title: 'Read',
          asset: Assets.action12,
          onPressed: () async {
            await pickFile([FileExtensions.pdf]).then((value) {
              if (value != null && context.mounted) {
                context.push(
                  ReadScreen.routePath,
                  extra: value,
                );
              }
            });
          },
        ),
        ActionCard(
          title: 'Print',
          asset: Assets.action13,
          onPressed: () {},
        ),
        ActionCard(
          title: 'Share',
          asset: Assets.action14,
          onPressed: () {},
        ),
        ActionCard(
          title: 'Browse Files',
          asset: Assets.action15,
          onPressed: () {},
        ),
      ],
    );
  }
}
