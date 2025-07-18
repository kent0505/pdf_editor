import 'package:flutter/material.dart';

/// {@template scaffold_padding}
/// ScaffoldPadding widget.
/// {@endtemplate}
class ScaffoldPadding extends EdgeInsets {
  const ScaffoldPadding._(final double value)
      : super.symmetric(horizontal: value);

  /// {@macro scaffold_padding}
  factory ScaffoldPadding.of(BuildContext context) => ScaffoldPadding._(32);

  /// {@macro scaffold_padding}
  static Widget widget(BuildContext context, [Widget? child]) =>
      Padding(padding: ScaffoldPadding.of(context), child: child);

  /// {@macro scaffold_padding}
  static Widget sliver(BuildContext context, {Widget? sliver}) =>
      SliverPadding(padding: ScaffoldPadding.of(context), sliver: sliver);
}
