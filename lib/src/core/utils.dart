import 'dart:developer' as developer;
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:printing/printing.dart';

void logger(Object message) => developer.log(message.toString());

void printPDF() async {
  // await Printing.layoutPdf(
  //   onLayout: (PdfPageFormat format) async => doc.save(),
  // );
}

void launchURL(String uri) async {
  try {
    final url = Uri.parse(uri);
    await launchUrl(url, mode: LaunchMode.platformDefault);
  } catch (e) {
    logger(e);
  }
}

Future<File?> pickFile() async {
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
  } catch (e) {
    logger(e);
  }
  return null;
}

extension FirstWhereOrNullExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
