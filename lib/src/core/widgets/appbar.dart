import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../utils.dart';
import 'button.dart';
import 'svg_widget.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
    this.title = '',
    this.right,
    this.child,
  });

  final String title;
  final Widget? right;
  final Widget? child;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: child ?? Text(title),
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 8,
          bottom: 8,
        ),
        child: Button(
          onPressed: () {
            try {
              context.pop();
            } catch (e) {
              logger(e);
            }
          },
          child: SvgWidget(Assets.back),
        ),
      ),
      actions: [right ?? const SizedBox()],
    );
  }
}

//import 'package:flutter/material.dart';

/// {@template scaffold_sliver_app_bar}
/// ScaffoldSliverAppBar widget.
/// {@endtemplate}
class ScaffoldSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// {@macro scaffold_sliver_app_bar}
  const ScaffoldSliverAppBar({super.key, required this.title, this.actions});

  final String title;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final actionsIsNotNull = actions != null;
    return AppBar(
      backgroundColor: const Color(0xffF2F2F7),
      centerTitle: false,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontFamily: AppFonts.w700,
      ),
      title: actionsIsNotNull ? null : Text(title),
      actions: actions,
      bottom: actionsIsNotNull
          ? _BottomAppBarTitle(context: context, title: title)
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

/// {@template scaffold_sliver_app_bar}
/// _BottomAppBarTitle widget.
/// {@endtemplate}
class _BottomAppBarTitle extends StatelessWidget
    implements PreferredSizeWidget {
  /// {@macro scaffold_sliver_app_bar}
  const _BottomAppBarTitle({required this.context, required this.title});

  final BuildContext context;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 37),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: AppFonts.w700,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.sizeOf(context).width, 33);
}
