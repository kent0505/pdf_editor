import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../core/widgets/appbar.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key, required this.file});

  final File file;

  static const routePath = '/ReadScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Read'),
      body: SfPdfViewer.file(
        file,
        scrollDirection: PdfScrollDirection.horizontal,
        pageLayoutMode: PdfPageLayoutMode.single,
        canShowPageLoadingIndicator: false,
      ),
    );
  }
}
