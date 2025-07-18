import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_editor/src/core/widgets/scaffold_padding.dart';

/// {@template files_screen}
/// _SearchTextField widget.
/// {@endtemplate}
class SearchTextField extends StatelessWidget {
  /// {@macro files_screen}
  const SearchTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xffAFAFAF);
    return ScaffoldPadding.sliver(
      context,
      sliver: SliverToBoxAdapter(
        child: CupertinoSearchTextField(
          backgroundColor: Colors.white,
          itemColor: primaryColor,
          placeholderStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.0,
            letterSpacing: 0,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
