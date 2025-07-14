import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/svg_widget.dart';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({super.key, required this.file});

  final File file;

  static const routePath = '/CameraPreviewScreen';

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  final screenshotController = ScreenshotController();

  void onPrint() async {
    final pdf = pw.Document();

    final bytes = await screenshotController.capture();
    if (bytes != null) {
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

      printPDF(pdf);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        right: Button(
          onPressed: onPrint,
          child: const SvgWidget(Assets.action13),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Screenshot(
              controller: screenshotController,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.center,
                  widthFactor: 250 / MediaQuery.sizeOf(context).width,
                  heightFactor:
                      250 / (MediaQuery.sizeOf(context).width * 1.414),
                  child: Image.file(
                    widget.file,
                    frameBuilder: ImageWidget.frameBuilder,
                    errorBuilder: ImageWidget.errorBuilder,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 250,
              height: 250 * 1.414,
            ),
          ),
        ],
      ),
    );
  }
}
