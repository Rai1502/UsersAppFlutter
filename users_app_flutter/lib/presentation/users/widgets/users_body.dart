import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_flutter/presentation/constants/dimens.dart';
import 'package:users_app_flutter/presentation/style/text_theme.dart';
import 'package:users_app_flutter/presentation/users/cubit/users_cubit.dart';
import 'package:users_app_flutter/presentation/users/widgets/users_tile.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key, required this.cubit});

  final UsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: LinearProgressIndicator(),
              )
            : SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async {
                    cubit.getUsers();
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(Dimens.marginGeneral,
                          Dimens.marginGeneral, Dimens.marginGeneral, 80),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Lista de Usuarios',
                              style: getTextTheme(context).displayMedium,
                            ),
                          ),
                          const _Space(),
                          BlocBuilder<UsersCubit, UsersState>(
                              builder: (BuildContext contex, UsersState state) {
                            return state.users.isEmpty
                                ? Center(
                                    child: Text(
                                      'No hay usuarios disponibles',
                                      style:
                                          getTextTheme(context).displayMedium,
                                    ),
                                  )
                                : Container(
                                    width: 350,
                                    decoration: BoxDecoration(
                                      // color: ColorPalette.usersBackGround
                                      //     .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: ListView.builder(
                                      itemCount: state.users.length,
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final user = state.users[index];
                                        return UsersTile(user: user);
                                      },
                                    ),
                                  );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class _Space extends StatelessWidget {
  const _Space();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: Dimens.marginGeneral,
      width: Dimens.marginGeneral,
    );
  }
}
