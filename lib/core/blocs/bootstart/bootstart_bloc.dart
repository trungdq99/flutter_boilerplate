import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/usecase.dart';
import '../../../domain/usecases/user/get_user_by_token.dart';
import '../../../domain/usecases/authentication/get_token.dart';
import '../../../domain/usecases/authentication/is_authenticated_user.dart';
import '../../../domain/usecases/movie/is_local_movie_empty.dart';
import '../../../domain/usecases/movie/movie_bootstart_sync.dart';
import '../../consts/enums.dart';
import '../../utils/connectivity_utils.dart';
import '../authentication/authentication_bloc.dart';
import '../bases/bloc_base.dart';
import '../bases/bloc_event_base.dart';
import '../bases/bloc_state_base.dart';

part 'bootstart_event.dart';
part 'bootstart_state.dart';

@lazySingleton
class BootStartBloc extends Bloc<BootstartEvent, BootStartState>
    with AppBlocBase {
  final ConnectivityUtils connectivityUtils;
  final IsAuthenticatedUser isAuthenticatedUser;
  final GetUserToken getToken;
  final GetUserByToken getAuthenticatedUser;
  final IsLocalMovieEmpty isLocalMovieEmpty;
  final MovieBootstartSync movieBootstartSync;

  BootStartBloc({
    required this.connectivityUtils,
    required this.isAuthenticatedUser,
    required this.getToken,
    required this.getAuthenticatedUser,
    required this.isLocalMovieEmpty,
    required this.movieBootstartSync,
  }) : super(UnBootstartState()) {
    on<BootstartEvent>(
      (event, emit) => event.applyAsync(
        currentState: state,
        bloc: this,
        emit: emit,
      ),
    );
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    add(BootstartEvent(
        toState: BootstartStateOnMessageState.fromOldSettingState(
            message: message, type: type)));
  }
}
