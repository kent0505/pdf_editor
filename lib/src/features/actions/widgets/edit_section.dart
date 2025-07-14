import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import 'action_card.dart';
import 'section_wrap.dart';

class EditSection extends StatelessWidget {
  const EditSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
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
    );
  }
}
