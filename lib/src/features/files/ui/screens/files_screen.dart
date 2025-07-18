import 'package:flutter/material.dart';
import 'package:pdf_editor/src/core/widgets/appbar.dart';
import 'package:pdf_editor/src/core/widgets/search_text_field.dart';

/// {@template files_screen}
/// FilesScreen widget.
/// {@endtemplate}
class FilesScreen extends StatefulWidget {
  /// {@macro files_screen}
  const FilesScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

/// State for widget FilesScreen.
class _FilesScreenState extends State<FilesScreen> {
  late final TextEditingController _searcController;
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _searcController = TextEditingController();
    // Initial state initialization
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        body: CustomScrollView(
          slivers: [SearchTextField(controller: _searcController)],
        ));
  }
}
