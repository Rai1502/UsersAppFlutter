import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_flutter/presentation/users/cubit/users_cubit.dart';
import 'package:users_app_flutter/presentation/users/widgets/users_body.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersCubit cubit = context.read<UsersCubit>();
    return Scaffold(
      body: UsersBody(cubit: cubit),
    );
  }
}
