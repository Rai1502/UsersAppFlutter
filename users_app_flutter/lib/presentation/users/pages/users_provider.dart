import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_flutter/data/data_repositories/users_data_repository.dart';
import 'package:users_app_flutter/presentation/users/cubit/users_cubit.dart';
import 'package:users_app_flutter/presentation/users/pages/users_page.dart';
import 'package:users_app_flutter/remote/remote_source/users_remote_source.dart';

class UsersProvider extends StatelessWidget {
  const UsersProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersCubit(
        UsersDataRepository(usersSource: UsersRemoteSource()),
      ),
      child: const UsersPage(),
    );
  }
}
