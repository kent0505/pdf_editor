import 'package:shared_preferences/shared_preferences.dart';

/// {@template favourites_controller}
/// FavouritesController.
/// {@endtemplate}
final class FavouritesController {
  /// {@macro favourites_controller}
  const FavouritesController({required SharedPreferences prefs})
      : _prefs = prefs;

  final SharedPreferences _prefs;

  /// Добавляешь путь до файла.
  ///
  /// Из списка забиараешь [File.path] и передаешь в этот метод в [path].
  Future<void> addFavourite(String path) async {
    final favourites = _prefs.getStringList('favourites') ?? [];
    favourites.add(path);
    await _prefs.setStringList('favourites', favourites);
  }

  /// Передаешь в [PdfDocumentLoader.openFile] путь до файла.
  List<String> getFavourites() => _prefs.getStringList('favourites') ?? [];
}
