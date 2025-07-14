import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../bloc/actions_bloc.dart';
import '../screens/converter_screen.dart';
import 'action_format.dart';
import 'section_wrap.dart';

class ConvertSection extends StatelessWidget {
  const ConvertSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();

    return SectionWrap(
      children: [
        ActionFormat(
          title: 'Image to PDF',
          format1: Assets.format1,
          format2: Assets.format2,
          onPressed: () async {
            final images = await pickImages();
            if (images.isNotEmpty && context.mounted) {
              bloc.add(ConvertImagesToPdfEvent(images: images));
              context.push(ConverterScreen.routePath);
            }
          },
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
        ActionFormat(
          title: 'Docx to Text',
          format1: Assets.format4,
          format2: Assets.format3,
          onPressed: () {},
        ),
      ],
    );
  }
}
