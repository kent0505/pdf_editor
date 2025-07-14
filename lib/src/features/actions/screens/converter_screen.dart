import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/actions_bloc.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  static const routePath = '/ConverterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Converter'),
      body: BlocBuilder<ActionsBloc, ActionsState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                switch (state) {
                  ActionsLoading() => 'Converting...',
                  ActionsConverted() => 'Converted',
                  _ => '',
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: AppFonts.w600,
                ),
              ),
              const SizedBox(height: 20),
              switch (state) {
                ActionsLoading() => const SizedBox(
                    height: 56,
                    child: LoadingWidget(),
                  ),
                ActionsConverted() => MainButton(
                    title: 'Share',
                    horizontal: 16,
                    onPressed: () {
                      shareFiles([state.file]);
                    },
                  ),
                _ => const SizedBox(),
              }
            ],
          );
        },
      ),
    );
  }
}
