part of 'actions_bloc.dart';

@immutable
sealed class ActionsState {}

final class ActionsInitial extends ActionsState {}

final class ActionsLoading extends ActionsState {}

final class ActionsConverted extends ActionsState {
  ActionsConverted({required this.file});

  final File file;
}
