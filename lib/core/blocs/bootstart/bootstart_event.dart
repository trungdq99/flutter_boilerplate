import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/usecase.dart';
import '../authentication/index.dart';
import '../bases/bloc_event_base.dart';
import 'index.dart';

class BootstartEvent extends BlocEventBase<BootStartState, BootStartBloc> {
  BootstartEvent({super.toState});
}

/// [LoadBootStartEvent] is used for booting start the app essentials in the begining.
/// [LoadBootStartEvent] fetchs Movie list from the API to local If not before, and authenticates user If has token
class LoadBootStartEvent extends BootstartEvent {
  @override
  Future<void> applyAsync({
    required BootStartState currentState,
    required BootStartBloc bloc,
    required Emitter<BootStartState> emit,
  }) async {
    emit(BootstartStateOnMessageState.fromOldSettingState(
        message: t("app_starting")));
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
        emit(BootstartStateOnMessageState.fromOldSettingState(
            message: t('need_network_connection')));
        return;
      }
    }

    emit(BootstartStateOnMessageState.fromOldSettingState(
        message: t('looking_authentication')));
    await Future.delayed(const Duration(seconds: 1));
    bool? isAuthenticated =
        bloc.extractEither(await bloc.isAuthenticatedUser(NoParams()));

    if (isAuthenticated == true) {
      emit(BootstartStateOnMessageState.fromOldSettingState(
          message: t('fetching_info')));
      String? token =
          bloc.extractEither<String>(await bloc.getToken(NoParams()));
      UserEntity? userEntity = bloc.extractEither<UserEntity>(
          await bloc.getAuthenticatedUser(NoParams()));
      emit(BootstartStateOnMessageState.fromOldSettingState(
          message: t('redirecting_to_page', params: ['home'])));
      GetIt.instance.get<AuthenticationBloc>().add(
          BootStartLoadAuthenticationEvent(user: userEntity, token: token));
      await Future.delayed(const Duration(seconds: 1));
    } else {
      emit(BootstartStateOnMessageState.fromOldSettingState(
          message: t('redirecting_to_page', params: ['login'])));
      await Future.delayed(const Duration(seconds: 1));
    }
    emit(BootStartIsOverState());
  }
}
