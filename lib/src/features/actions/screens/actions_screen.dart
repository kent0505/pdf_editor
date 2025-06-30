import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../widgets/action_card.dart';
import '../widgets/action_format.dart';
import '../widgets/action_title.dart';
import 'read_screen.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onRead() async {
      await pickFile().then((value) {
        if (value != null && context.mounted) {
          context.push(
            ReadScreen.routePath,
            extra: value,
          );
        }
      });
    }

    void onPrint() {}

    void onShare() {
      final appUrl = '';
      Share.share('Check out this app: $appUrl');
    }

    void onBrowse() {}

    return ListView(
      padding: const EdgeInsets.all(26),
      children: [
        const ActionTitle(title: 'Edit'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Edit Text & Image',
              asset: Assets.action1,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Fill & Sign',
              asset: Assets.action2,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Scan'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Scan to PDF',
              asset: Assets.action3,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan Book',
              asset: Assets.action4,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan ID card',
              asset: Assets.action5,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan to PDF',
              asset: Assets.action6,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan Book',
              asset: Assets.action7,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan ID card',
              asset: Assets.action8,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Create'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Create Blank',
              asset: Assets.action9,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Combine PDF’s',
              asset: Assets.action10,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Recognize'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Scan to Text',
              asset: Assets.action11,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Convert'),
        _Wrap(
          children: [
            ActionFormat(
              title: 'Image to PDF',
              format1: Assets.format1,
              format2: Assets.format2,
              onPressed: () {},
            ),
            ActionFormat(
              title: 'PDF to Image',
              format1: Assets.format2,
              format2: Assets.format1,
              onPressed: () {},
            ),
            ActionFormat(
              title: 'PDF to Text',
              format1: Assets.format2,
              format2: Assets.format3,
              onPressed: () {},
            ),
            ActionFormat(
              title: 'Text to PDF',
              format1: Assets.format3,
              format2: Assets.format2,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Read and Review'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Read',
              asset: Assets.action12,
              onPressed: onRead,
            ),
            ActionCard(
              title: 'Print',
              asset: Assets.action13,
              onPressed: onPrint,
            ),
            ActionCard(
              title: 'Share',
              asset: Assets.action14,
              onPressed: onShare,
            ),
            ActionCard(
              title: 'Browse Files',
              asset: Assets.action15,
              onPressed: onBrowse,
            ),
          ],
        ),
      ],
    );
  }
}

class _Wrap extends StatelessWidget {
  const _Wrap({required this.children});

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
