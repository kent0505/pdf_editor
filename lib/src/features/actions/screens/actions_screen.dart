import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart' hide PdfDocument;
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:docx_to_text/docx_to_text.dart';
import 'package:pdf_render/pdf_render.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../widgets/action_card.dart';
import '../widgets/action_format.dart';
import '../widgets/action_title.dart';
import 'read_screen.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onRead() async {
      await pickFile().then((value) {
        if (value != null && context.mounted) {
          context.push(
            ReadScreen.routePath,
            extra: value,
          );
        }
      });
    }

    void onPrint() {}

    void onShare() {
      final appUrl = '';
      Share.share('Check out this app: $appUrl');
    }

    void onBrowse() {}

    void onImageToPdf() async {
      final images = await pickImages();
      final pdf = pw.Document();
      for (final image in images) {
        final imageBytes = await image.readAsBytes();
        final imageWidget = pw.MemoryImage(imageBytes);
        pdf.addPage(
          pw.Page(
            margin: pw.EdgeInsets.zero,
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Image(
                  imageWidget,
                  fit: pw.BoxFit.contain,
                ),
              );
            },
          ),
        );
      }
      final file = await createFile(
        filename: 'images',
        format: 'pdf',
      );
      await file.writeAsBytes(await pdf.save());
      shareFiles([file]);
    }

    void onPdfToImage() async {
      final picked = await pickFile(allowedExtensions: ['pdf']);
      List<File> files = [];
      if (picked != null) {
        final doc = await PdfDocument.openFile(picked.path);
        final pageCount = doc.pageCount;
        for (int i = 1; i <= pageCount; i++) {
          final page = await doc.getPage(i);
          final pageImage = await page.render(
            width: page.width.toInt(),
            height: page.height.toInt(),
          );
          final imageBytes = pageImage.pixels;
          final dir = await getTemporaryDirectory();
          final file = File('${dir.path}/page_$i.png');
          await file.writeAsBytes(imageBytes);
          files.add(file);
        }
        await doc.dispose();
        shareFiles(files);
      }
    }

    void onPdfToText() {}

    void onTextToPdf() async {
      await pickFile(allowedExtensions: ['txt']).then(
        (value) async {
          if (value != null) {
            final textContent = await value.readAsString();
            final pdf = pw.Document();
            final paragraphs = textContent.split('\n');
            pdf.addPage(
              pw.MultiPage(
                build: (pw.Context context) => paragraphs
                    .map(
                      (para) => pw.Text(
                        para,
                        style: const pw.TextStyle(fontSize: 12),
                      ),
                    )
                    .toList(),
              ),
            );
            final file = await createFile(
              filename: 'converted',
              format: 'pdf',
            );
            await file.writeAsBytes(await pdf.save());
            shareFiles([file]);
          }
        },
      );
    }

    void onDocxToText() async {
      await pickFile(allowedExtensions: [
        'DOC',
        'DOCX',
      ]).then((value) async {
        if (value != null && context.mounted) {
          final bytes = await value.readAsBytes();
          final text = docxToText(bytes);
          final file = await createFile(
            filename: 'converted_text',
            format: 'txt',
          );
          await file.writeAsString(text);
          shareFiles([file]);
        }
      });
    }

    return ListView(
      padding: const EdgeInsets.all(26),
      children: [
        const ActionTitle(title: 'Edit'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Edit Text & Image',
              asset: Assets.action1,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Fill & Sign',
              asset: Assets.action2,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Scan'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Scan to PDF',
              asset: Assets.action3,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan Book',
              asset: Assets.action4,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan ID card',
              asset: Assets.action5,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan to PDF',
              asset: Assets.action6,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan Book',
              asset: Assets.action7,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Scan ID card',
              asset: Assets.action8,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Create'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Create Blank',
              asset: Assets.action9,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Combine PDF’s',
              asset: Assets.action10,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Recognize'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Scan to Text',
              asset: Assets.action11,
              onPressed: () {},
            ),
          ],
        ),
        const ActionTitle(title: 'Convert'),
        _Wrap(
          children: [
            ActionFormat(
              title: 'Image to PDF',
              format1: Assets.format1,
              format2: Assets.format2,
              onPressed: onImageToPdf,
            ),
            ActionFormat(
              title: 'PDF to Image',
              format1: Assets.format2,
              format2: Assets.format1,
              onPressed: onPdfToImage,
            ),
            ActionFormat(
              title: 'PDF to Text',
              format1: Assets.format2,
              format2: Assets.format3,
              onPressed: onPdfToText,
            ),
            ActionFormat(
              title: 'Text to PDF',
              format1: Assets.format3,
              format2: Assets.format2,
              onPressed: onTextToPdf,
            ),
            ActionFormat(
              title: 'Docx to Text',
              format1: Assets.format4,
              format2: Assets.format3,
              onPressed: onDocxToText,
            ),
          ],
        ),
        const ActionTitle(title: 'Read and Review'),
        _Wrap(
          children: [
            ActionCard(
              title: 'Read',
              asset: Assets.action12,
              onPressed: onRead,
            ),
            ActionCard(
              title: 'Print',
              asset: Assets.action13,
              onPressed: onPrint,
            ),
            ActionCard(
              title: 'Share',
              asset: Assets.action14,
              onPressed: onShare,
            ),
            ActionCard(
              title: 'Browse Files',
              asset: Assets.action15,
              onPressed: onBrowse,
            ),
          ],
        ),
      ],
    );
  }
}

class _Wrap extends StatelessWidget {
  const _Wrap({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: children,
    );
  }
}
