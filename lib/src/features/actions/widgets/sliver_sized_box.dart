import 'package:flutter/material.dart';

/// {@template sliver_sized_box}
/// SliverSizedBox widget.
/// {@endtemplate}
class SliverSizedBox extends StatelessWidget {
  /// {@macro sliver_sized_box}
  const SliverSizedBox({
    this.height,
    this.width,
    super.key, // ignore: unused_element
  });

  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
