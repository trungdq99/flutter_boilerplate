part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<MovieEntity> movieList;
  const HomeState({required this.movieList});

  @override
  List<Object> get props => [movieList];
}

class UnHomeState extends HomeState {
  const UnHomeState({required super.movieList});
}

class HomeInProgressState extends HomeState with BlocInProgressStateBase {
  HomeInProgressState.fromOldState(HomeState oldState,
      {List<MovieEntity>? movieList, MovieModel? selectedMovie})
      : super(movieList: movieList ?? oldState.movieList);
}

class HomeLoaddedState extends HomeState {
  HomeLoaddedState.fromOldState(HomeState oldState,
      {List<MovieEntity>? movieList, MovieModel? selectedMovie})
      : super(movieList: movieList ?? oldState.movieList);
}

// ignore: must_be_immutable
class HomeOnMessageState extends HomeState with BlocOnMessageStateBase {
  HomeOnMessageState.fromOldState(HomeState oldState,
      {List<MovieEntity>? movieList,
      MovieModel? selectedMovie,
      required String message,
      type = MessageType.info})
      : super(movieList: movieList ?? oldState.movieList) {
    this.message = message;
    this.type = type;
  }
}
