part of 'settings_bloc.dart';

class SettingsState {
  SettingsState({
    this.loading = false,
    this.granted = false,
    this.faceID = false,
  });

  final bool loading;
  final bool granted;
  final bool faceID;
}
