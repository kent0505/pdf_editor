import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/utils.dart';

part 'actions_event.dart';
part 'actions_state.dart';

class ActionsBloc extends Bloc<ActionsEvent, ActionsState> {
  ActionsBloc() : super(ActionsInitial()) {
    on<ActionsEvent>(
      (event, emit) => switch (event) {
        ConvertImagesToPdfEvent() => _convertImageToPdfEvent(event, emit),
      },
    );
  }

  void _convertImageToPdfEvent(
    ConvertImagesToPdfEvent event,
    Emitter<ActionsState> emit,
  ) async {
    emit(ActionsLoading());

    final pdf = pw.Document();
    for (final image in event.images) {
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
    emit(ActionsConverted(file: file));
  }
}




// await pickFile(allowedExtensions: ['txt']).then(
//         (value) async {
//           if (value != null) {
//             final textContent = await value.readAsString();
//             final pdf = pw.Document();
//             final paragraphs = textContent.split('\n');
//             pdf.addPage(
//               pw.MultiPage(
//                 build: (pw.Context context) => paragraphs
//                     .map(
//                       (para) => pw.Text(
//                         para,
//                         style: const pw.TextStyle(fontSize: 12),
//                       ),
//                     )
//                     .toList(),
//               ),
//             );
//             final file = await createFile(
//               filename: 'converted',
//               format: 'pdf',
//             );
//             await file.writeAsBytes(await pdf.save());
//             shareFiles([file]);
//           }
//         },
//       );