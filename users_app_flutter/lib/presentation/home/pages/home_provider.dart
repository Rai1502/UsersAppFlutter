import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_flutter/presentation/home/cubit/home_cubit.dart';
import 'package:users_app_flutter/presentation/home/pages/home_page.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomePage(),
    );
  }
}
