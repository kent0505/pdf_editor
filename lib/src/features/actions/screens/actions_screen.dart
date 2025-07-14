import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:docx_to_text/docx_to_text.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../bloc/actions_bloc.dart';
import '../widgets/action_card.dart';
import '../widgets/action_format.dart';
import '../widgets/action_title.dart';
import 'camera_screen.dart';
import 'converter_screen.dart';
import 'read_screen.dart';
import 'scanned_screen.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({super.key});

  @override
  State<ActionsScreen> createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  void onImageToPdf() async {
    final images = await pickImages();
    if (images.isNotEmpty && mounted) {
      context.read<ActionsBloc>().add(ConvertImagesToPdfEvent(images: images));
      context.push(ConverterScreen.routePath);
    }
  }

  void onScan() async {
    await Permission.camera.request();
    try {
      await CunningDocumentScanner.getPictures().then((value) {
        if (value != null && value.isNotEmpty && mounted) {
          context.push(
            ScannedScreen.routePath,
            extra: value,
          );
        }
      });
    } catch (e) {
      logger(e);
    }
  }

  void onScanBook() async {
    await Permission.camera.request();
    if (mounted) {
      context.push(CameraScreen.routePath);
    }
  }

  void onRead() async {
    await pickFile([FileExtensions.pdf]).then((value) {
      if (value != null && mounted) {
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

  void onPdfToImage() async {
    final picked = await pickFile([FileExtensions.pdf]);
    if (picked != null) {}
  }

  void onPdfToText() {}

  void onTextToPdf() async {
    await pickFile([FileExtensions.txt]).then(
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
            format: FileExtensions.pdf,
          );
          await file.writeAsBytes(await pdf.save());
          shareFiles([file]);
        }
      },
    );
  }

  void onDocxToText() async {
    await pickFile([
      FileExtensions.doc,
      FileExtensions.docx,
    ]).then((value) async {
      if (value != null && mounted) {
        final bytes = await value.readAsBytes();
        final text = docxToText(bytes);
        final file = await createFile(
          filename: 'converted_text',
          format: FileExtensions.txt,
        );
        await file.writeAsString(text);
        shareFiles([file]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: onScan,
            ),
            ActionCard(
              title: 'Scan Book',
              asset: Assets.action4,
              onPressed: onScanBook,
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
