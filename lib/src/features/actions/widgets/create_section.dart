import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../screens/pdf_screen.dart';
import 'action_card.dart';
import 'section_wrap.dart';

class CreateSection extends StatelessWidget {
  const CreateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      children: [
        ActionCard(
          title: 'Create Blank',
          asset: Assets.action9,
          onPressed: () {
            context.push(PdfScreen.routePath);
          },
        ),
        ActionCard(
          title: 'Combine PDF’s',
          asset: Assets.action10,
          onPressed: () {},
        ),
      ],
    );
  }
}
