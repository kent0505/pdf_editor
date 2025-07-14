import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../widgets/action_card.dart';
import '../widgets/action_title.dart';
import '../widgets/convert_section.dart';
import '../widgets/create_section.dart';
import '../widgets/edit_section.dart';
import '../widgets/read_section.dart';
import '../widgets/scan_section.dart';
import '../widgets/section_wrap.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({super.key});

  @override
  State<ActionsScreen> createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(26),
      children: [
        const ActionTitle(title: 'Edit'),
        const EditSection(),
        const ActionTitle(title: 'Scan'),
        const ScanSection(),
        const ActionTitle(title: 'Create'),
        const CreateSection(),
        const ActionTitle(title: 'Recognize'),
        SectionWrap(
          children: [
            ActionCard(
              title: 'Scan to Text',
              asset: Assets.action11,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Convert'),
        const ConvertSection(),
        const ActionTitle(title: 'Read and Review'),
        const ReadSection(),
      ],
    );
  }
}
