import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nextgen_pdf_editor/nextgen_pdf_editor.dart' show NGPdf;
import 'package:pdf_editor/src/core/widgets/scaffold_padding.dart';

import 'package:nextgen_pdf_editor/nextgen_pdf_editor.dart';

import 'package:pdf_editor/src/features/files/logic/pdf_view_controller.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

/// {@template files_grid_view}
/// FilesGridView widget.
/// {@endtemplate}
class FilesGridView extends StatefulWidget {
  /// {@macro files_grid_view}
  const FilesGridView({
    super.key, // ignore: unused_element
  });

  @override
  State<FilesGridView> createState() => _FilesGridViewState();
}

/// State for widget FilesGridView.
class _FilesGridViewState extends State<FilesGridView> {
  late Future<List<String>> _futureListPath;
  /* #region Lifecycle */

  @override
  void initState() {
    super.initState();
    _futureListPath = PDFFileManager.getSavedPDFs();
    // Initial state initialization
  }

  /* #endregion */

  @override
  Widget build(BuildContext context) {
    return ScaffoldPadding.sliver(
      context,
      sliver: FutureBuilder(
        future: _futureListPath,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            final data = asyncSnapshot.data!;

            if (data.isEmpty) return const _FileEmpty();

            return SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.45,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _PdfViewCard(path: data[index]);
              },
            );
          }
          return const SliverToBoxAdapter();
        },
      ),
    );
  }
}

/// {@template files_grid_view}
/// _FileEmpty widget.
/// {@endtemplate}
class _FileEmpty extends StatelessWidget {
  /// {@macro files_grid_view}
  const _FileEmpty();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
       'no files yet',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}

/// {@template files_grid_view}
/// _PdfViewCard widget.
/// {@endtemplate}
class _PdfViewCard extends StatefulWidget {
  /// {@macro files_grid_view}
  const _PdfViewCard({required this.path});

  final String path;

  @override
  State<_PdfViewCard> createState() => _PdfViewCardState();
}

class _PdfViewCardState extends State<_PdfViewCard> {
  // late final PDFViewController _pdfViewController;

  // @override
  // void initState() {
  //   super.initState();
  //   _pdfViewController = PDFViewController();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _editPDF();
      },
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: PdfDocumentLoader.openFile(
              widget.path,
              pageNumber: 1,
              pageBuilder: (context, textureBuilder, pageSize) =>
                  textureBuilder(),
            ),
          ),
          FutureBuilder<FileStat>(
            future: File(widget.path).stat(),
            builder: (context, snapshot) {
              final file = File(widget.path);
              final fileName = file.uri.pathSegments.last;
              String date = '...';
              String size = '...';
              if (snapshot.hasData) {
                date =
                    '${snapshot.data!.modified.day}/${snapshot.data!.modified.month}/${snapshot.data!.modified.year % 100}';
                size = (snapshot.data!.size / (1024 * 1024)).toStringAsFixed(2);
              }
              return Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    fileName,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xffAFAFAF),
                    ),
                  ),
                  Text(
                    date,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.2,
                      letterSpacing: 0,
                      color: Color(0xffAFAFAF),
                    ),
                  ),
                  Text(
                    '${size}MB',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xffAFAFAF),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _editPDF() async {
    File? editedFile = await NGPdf.openEditor(context, File(widget.path));
  }
}
