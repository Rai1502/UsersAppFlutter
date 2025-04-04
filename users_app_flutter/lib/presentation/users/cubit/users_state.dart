part of 'users_cubit.dart';

@freezed
abstract class UsersState with _$UsersState {
  factory UsersState({
    @Default(false) bool isLoading,
    @Default([]) List<Users> users,
  }) = _UsersState;
}
