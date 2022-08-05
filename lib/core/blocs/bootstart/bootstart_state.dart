import '../../consts/enums.dart';
import '../bases/bloc_state_base.dart';

abstract class BootStartState {}

/// UnInitialized
class UnBootstartState extends BootStartState {}

class BootStartIsOverState extends BootStartState {}

class BootstartStateOnMessageState extends BootStartState
    with BlocOnMessageStateBase {
  BootstartStateOnMessageState.fromOldSettingState({
    required String message,
    MessageType type = MessageType.info,
  }) {
    this.message = message;
    this.type = type;
  }
}
