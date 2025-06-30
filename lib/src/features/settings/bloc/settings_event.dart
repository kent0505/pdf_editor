part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

final class SaveFaceID extends SettingsEvent {
  SaveFaceID({required this.value});

  final bool value;
}

class CheckBiometric extends SettingsEvent {}
