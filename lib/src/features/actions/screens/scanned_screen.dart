import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/svg_widget.dart';

class ScannedScreen extends StatefulWidget {
  const ScannedScreen({super.key, required this.paths});

  final List<String> paths;

  static const routePath = '/ScannedScreen';

  @override
  State<ScannedScreen> createState() => _ScannedScreenState();
}

class _ScannedScreenState extends State<ScannedScreen> {
  List<File> files = [];

  @override
  void initState() {
    super.initState();
    files = List.generate(
      widget.paths.length,
      (index) {
        return File(widget.paths[index]);
      },
    );
  }

  void onPrint() async {
    final pdf = pw.Document();

    for (final file in files) {
      final bytes = await file.readAsBytes();

      pdf.addPage(
        pw.Page(
          margin: pw.EdgeInsets.zero,
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Center(
              child: pw.Image(
                pw.MemoryImage(bytes),
                fit: pw.BoxFit.contain,
              ),
            );
          },
        ),
      );
    }

    printPDF(pdf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Scanned',
        right: Button(
          onPressed: onPrint,
          child: const SvgWidget(Assets.action13),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: files.length,
        itemBuilder: (context, index) {
          return Image.file(
            files[index],
            frameBuilder: ImageWidget.frameBuilder,
            errorBuilder: ImageWidget.errorBuilder,
          );
        },
      ),
    );
  }
}
