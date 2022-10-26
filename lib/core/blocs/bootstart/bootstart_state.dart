part of 'bootstart_bloc.dart';

abstract class BootStartState {}

/// UnInitialized
class UnBootStartState extends BootStartState {}

class BootStartIsOverState extends BootStartState {}

class BootStartOnMessageState extends BootStartState
    with BlocOnMessageStateBase {
  BootStartOnMessageState.fromOldState({
    required String message,
    MessageType type = MessageType.info,
  }) {
    this.message = message;
    this.type = type;
  }
}
