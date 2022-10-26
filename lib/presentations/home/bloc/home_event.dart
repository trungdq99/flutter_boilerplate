part of 'home_bloc.dart';

class HomeEvent extends BlocEventBase<HomeState, HomeBloc> {
  HomeEvent({super.toState});
}

class LoadLocalMovieListEvent extends HomeEvent {
  @override
  Future<void> applyAsync({
    required HomeState currentState,
    required HomeBloc bloc,
    required Emitter<HomeState> emit,
  }) async {
    emit(HomeInProgressState.fromOldState(currentState));
    final movieList =
        bloc.extractEither(await bloc.getLocalMovieList(NoParams()));
    //bloc.extractEither(await bloc.clearLocalMovieList(NoParams()));
    emit(HomeLoaddedState.fromOldState(currentState, movieList: movieList));
  }
}

class SearchMovieByTitleEvent extends HomeEvent {
  final String title;

  SearchMovieByTitleEvent({required this.title});
  @override
  Future<void> applyAsync({
    required HomeState currentState,
    required HomeBloc bloc,
    required Emitter<HomeState> emit,
  }) async {
    emit(HomeInProgressState.fromOldState(currentState));
    final movieList =
        bloc.extractEither(await bloc.searchMovieByTitle(Params(title)));
    //bloc.extractEither(await bloc.clearLocalMovieList(NoParams()));
    emit(HomeLoaddedState.fromOldState(currentState, movieList: movieList));
  }
}
