import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PDFFileManager {
  static Future<String> get _appDocumentsPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<String?> savePDFToAppDirectory() async {
    try {
      // Выбираем PDF файл
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        final sourcePath = file.path!;

        // Получаем путь к директории приложения
        final appDir = await _appDocumentsPath;
        final fileName = path.basename(sourcePath);
        final destinationPath = path.join(appDir, fileName);

        // Копируем файл
        await File(sourcePath).copy(destinationPath);

        print('PDF сохранен: $destinationPath');
        return destinationPath;
      }
    } catch (e) {
      print('Ошибка при сохранении PDF: $e');
    }
    return null;
  }

  static Future<List<String>> getSavedPDFs() async {
    final appDir = await _appDocumentsPath;
    final dir = Directory(appDir);

    try {
      final files = await dir.list().toList();
      print(files);
      return files
          .where((file) => file.path.toLowerCase().endsWith('.pdf'))
          .map((file) => file.path)
          .toList();
    } catch (e) {
      print('Ошибка при получении списка PDF: $e');
      return [];
    }
  }

  static Future<bool> deletePDF(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        return true;
      }
    } catch (e) {
      print('Ошибка при удалении PDF: $e');
    }
    return false;
  }

  
}
