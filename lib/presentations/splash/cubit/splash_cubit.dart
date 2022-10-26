import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
      : super(const SplashState(
          message: '',
          twenEnd: 3.0,
        ));

  void setMessage(String message) => emit(SplashState(
        message: message,
        twenEnd: state.twenEnd,
      ));
  void setTweenEnd(double tweenEnd) => emit(SplashState(
        message: state.message,
        twenEnd: tweenEnd,
      ));
}
