import 'dart:developer' as developer;
import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:printing/printing.dart';

void logger(Object message) => developer.log(message.toString());

void printPDF() async {
  // await Printing.layoutPdf(
  //   onLayout: (PdfPageFormat format) async => doc.save(),
  // );
}

void shareFiles(List<File> files) async {
  try {
    await Share.shareXFiles(
      List.generate(
        files.length,
        (index) {
          return XFile(files[index].path);
        },
      ),
      sharePositionOrigin: Rect.fromLTWH(100, 100, 200, 200),
    );
  } catch (e) {
    logger(e);
  }
}

void launchURL(String uri) async {
  try {
    final url = Uri.parse(uri);
    await launchUrl(url, mode: LaunchMode.platformDefault);
  } catch (e) {
    logger(e);
  }
}

Future<File?> pickFile({List<String> allowedExtensions = const ['pdf']}) async {
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
  } catch (e) {
    logger(e);
  }
  return null;
}

Future<List<XFile>> pickImages() async {
  try {
    final photos = await ImagePicker().pickMultiImage();
    return photos;
  } catch (e) {
    logger(e);
  }
  return [];
}

Future<String> getPath() async {
  final dir = await getTemporaryDirectory();
  return dir.path;
}

Future<File> createFile({
  required String filename,
  required String format,
}) async {
  final path = await getPath();
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final file = File('$path/${filename}_$timestamp.$format');
  return file;
}

extension FirstWhereOrNullExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
