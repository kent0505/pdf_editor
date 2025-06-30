import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

import '../../../core/utils.dart';
import '../data/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _repository;
  final LocalAuthentication _auth = LocalAuthentication();

  SettingsBloc({required SettingsRepository repository})
      : _repository = repository,
        super(SettingsState()) {
    on<SettingsEvent>(
      (event, emit) => switch (event) {
        SaveFaceID() => _saveFaceID(event, emit),
        CheckBiometric() => _checkBiometric(event, emit),
      },
    );
  }

  void _saveFaceID(
    SaveFaceID event,
    Emitter<SettingsState> emit,
  ) async {
    final value = !event.value;
    await _repository.setFaceID(value);
    emit(SettingsState(
      loading: false,
      granted: true,
      faceID: value,
    ));
  }

  Future<void> _checkBiometric(
    CheckBiometric event,
    Emitter<SettingsState> emit,
  ) async {
    final faceID = _repository.getFaceID();
    emit(SettingsState(
      loading: true,
      granted: !faceID,
      faceID: faceID,
    ));
    if (faceID) {
      try {
        final isAvailable = await _auth.canCheckBiometrics;
        final didAuthenticate = isAvailable
            ? await _auth.authenticate(
                localizedReason: 'Please authenticate with Face ID',
                options: const AuthenticationOptions(biometricOnly: true),
              )
            : false;

        emit(SettingsState(
          loading: didAuthenticate,
          granted: didAuthenticate,
          faceID: faceID,
        ));
      } catch (e) {
        logger(e);
        emit(SettingsState(
          loading: false,
          granted: false,
          faceID: faceID,
        ));
      }
    }
  }
}
