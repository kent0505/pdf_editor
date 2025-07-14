part of 'actions_bloc.dart';

@immutable
sealed class ActionsEvent {}

final class ConvertImagesToPdfEvent extends ActionsEvent {
  ConvertImagesToPdfEvent({required this.images});

  final List<XFile> images;
}
