part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final String message;
  final double twenEnd;

  const SplashState({
    required this.message,
    required this.twenEnd,
  });

  @override
  List<Object> get props => [
        message,
        twenEnd,
      ];
}
