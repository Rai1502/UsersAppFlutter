import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_flutter/presentation/login/cubit/login_cubit.dart';
import 'package:users_app_flutter/presentation/login/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read<LoginCubit>();
    return Scaffold(
      body: LoginBody(cubit),
    );
  }
}
