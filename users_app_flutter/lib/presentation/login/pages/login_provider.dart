import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_flutter/data/data_repositories/login_data_repository.dart';
import 'package:users_app_flutter/presentation/login/cubit/login_cubit.dart';
import 'package:users_app_flutter/presentation/login/pages/login_page.dart';
import 'package:users_app_flutter/remote/remote_source/login_remote_source.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(
        LoginDataRepository(
          loginSource: LoginRemoteSource(),
        ),
      ),
      child: LoginPage(),
    );
  }
}
