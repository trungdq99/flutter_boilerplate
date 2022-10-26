part of 'bootstart_bloc.dart';

class BootstartEvent extends BlocEventBase<BootStartState, BootStartBloc> {
  BootstartEvent({super.toState});
}

/// [BootStartLoadEvent] is used for booting start the app essentials in the begining.
/// [BootStartLoadEvent] fetchs Movie list from the API to local If not before, and authenticates user If has token
class BootStartLoadEvent extends BootstartEvent {
  @override
  Future<void> applyAsync({
    required BootStartState currentState,
    required BootStartBloc bloc,
    required Emitter<BootStartState> emit,
  }) async {
    emit(BootStartOnMessageState.fromOldState(
        message: t(AppLocalizationKey.appStarting)));
    await Future.delayed(const Duration(seconds: 2));

    bool? isLocalMovieListEmpty =
        bloc.extractEither(await bloc.isLocalMovieEmpty(NoParams()));
    if (isLocalMovieListEmpty == true) {
      if (await bloc.connectivityUtils.isDeviceOnline) {
        var movieSyncResult =
            bloc.extractEither(await bloc.movieBootstartSync(NoParams()));
        if (movieSyncResult == null) {
          return;
        }
      } else {
        emit(BootStartOnMessageState.fromOldState(
            message: t(AppLocalizationKey.needNetworkConnection)));
        return;
      }
    }

    emit(BootStartOnMessageState.fromOldState(
        message: t(AppLocalizationKey.lookingAuthentication)));
    await Future.delayed(const Duration(seconds: 1));
    bool? isAuthenticated =
        bloc.extractEither(await bloc.isAuthenticatedUser(NoParams()));

    if (isAuthenticated == true) {
      emit(BootStartOnMessageState.fromOldState(
          message: t(AppLocalizationKey.fetchingInfo)));
      String? token =
          bloc.extractEither<String>(await bloc.getToken(NoParams()));
      UserEntity? userEntity = bloc.extractEither<UserEntity>(
          await bloc.getAuthenticatedUser(NoParams()));
      emit(BootStartOnMessageState.fromOldState(
          message: t(AppLocalizationKey.redirectingToPage, params: ['home'])));
      GetIt.instance.get<AuthenticationBloc>().add(
          BootStartLoadAuthenticationEvent(user: userEntity, token: token));
      await Future.delayed(const Duration(seconds: 1));
    } else {
      emit(BootStartOnMessageState.fromOldState(
          message: t(AppLocalizationKey.redirectingToPage, params: ['login'])));
      await Future.delayed(const Duration(seconds: 1));
    }
    emit(BootStartIsOverState());
  }
}
