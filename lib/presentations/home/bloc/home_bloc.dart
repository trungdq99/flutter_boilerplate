import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/blocs/bases/bloc_base.dart';
import '../../../core/consts/enums.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/movie/get_local_movie_list.dart';
import '../../../domain/usecases/movie/search_movie_by_title.dart';
import 'index.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> with AppBlocBase {
  final GetLocalMovieList getLocalMovieList;
  final SearchMovieByTitle searchMovieByTitle;
  HomeBloc({required this.getLocalMovieList, required this.searchMovieByTitle})
      : super(const UnHomeState(
          movieList: <MovieEntity>[],
        )) {
    on<HomeEvent>(
      (event, emit) =>
          event.applyAsync(currentState: state, bloc: this, emit: emit),
    );
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    add(HomeEvent(
        toState: HomeOnMessageState.fromOldState(state,
            type: type, message: message)));
  }
}
