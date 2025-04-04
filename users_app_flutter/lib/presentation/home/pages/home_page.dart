import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_flutter/presentation/constants/color_palette.dart';
import 'package:users_app_flutter/presentation/home/cubit/home_cubit.dart';
import 'package:users_app_flutter/presentation/home/widgets/convex_navigation_bar.dart';
import 'package:users_app_flutter/presentation/style/text_theme.dart';
import 'package:users_app_flutter/presentation/users/pages/users_page.dart';
import 'package:users_app_flutter/presentation/users/pages/users_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: ColorPalette.backGround,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: ColorPalette.appBar,
          elevation: 5.0,
          title: Text(
            'Users App Flutter',
            style: getTextTheme(context)
                .headlineMedium!
                .copyWith(color: ColorPalette.backGround),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.exit_to_app),
                iconSize: 30,
                color: ColorPalette.backGround,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          return ConvexNavigationBar(
              currentIndex: state.currentIndex, onTap: cubit.setIndex);
        },
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, HomeState state) {
        switch (state.currentIndex) {
          case 0:
            return const UsersProvider();
          case 1:
            return const Center(child: Text('Proximamente....'));
        }
        return const Center(
          child: Text(''),
        );
      }),
    );
  }
}
