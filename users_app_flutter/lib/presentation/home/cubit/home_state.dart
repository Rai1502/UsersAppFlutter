part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default(0) int currentIndex,
  }) = _HomeState;
}
