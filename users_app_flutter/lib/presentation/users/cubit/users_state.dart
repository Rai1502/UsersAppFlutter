part of 'users_cubit.dart';

@freezed
abstract class UsersState with _$UsersState {
  factory UsersState({
    @Default(false) bool isLoading,
    @Default([]) List<Users> users,
    @Default('') String name,
    @Default('') String userName,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String web,
  }) = _UsersState;
}
