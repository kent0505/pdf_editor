import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../bloc/home_bloc.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

    return AppBar(
      centerTitle: false,
      shape: const Border(
        bottom: BorderSide(color: Colors.transparent),
      ),
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 32,
      ).copyWith(top: 8),
      title: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 16,
        ),
        child: Text(
          state is HomeSettings ? 'Settings' : 'XYZ',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: AppFonts.w700,
          ),
        ),
      ),
    );
  }
}
