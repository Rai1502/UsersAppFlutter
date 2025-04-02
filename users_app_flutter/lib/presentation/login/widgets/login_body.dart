import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_flutter/domain/errors/app_errors.dart';
import 'package:users_app_flutter/main.dart';
import 'package:users_app_flutter/presentation/constants/color_palette.dart';
import 'package:users_app_flutter/presentation/home/pages/home_page.dart';
import 'package:users_app_flutter/presentation/home/pages/home_provider.dart';
import 'package:users_app_flutter/presentation/login/cubit/login_cubit.dart';
import 'package:users_app_flutter/presentation/style/text_theme.dart';
import 'package:users_app_flutter/presentation/widgets/custom_alert_dialog.dart';
import 'package:users_app_flutter/presentation/widgets/custom_text_field.dart';
import 'package:users_app_flutter/presentation/widgets/main_button.dart';

class LoginBody extends StatefulWidget {
  const LoginBody(this.cubit, {super.key});

  final LoginCubit? cubit;

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController? _controllerEmail;
  TextEditingController? _controllerPassword;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    widget.cubit!.setEmail('');
    widget.cubit!.setPassword('');

    _controllerEmail = TextEditingController(text: widget.cubit!.state.email);
    _controllerPassword =
        TextEditingController(text: widget.cubit!.state.password);
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEmail?.dispose();
    _controllerPassword?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: ColorPalette.backGround,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                'Users App Login',
                style: getTextTheme(context).headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _controllerEmail,
                onChanged: widget.cubit?.setEmail,
                labelText: 'Email',
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _controllerPassword,
                onChanged: widget.cubit?.setPassword,
                labelText: 'Password',
                hintText: 'Password',
                keyboardType: TextInputType.text,
                obscureText: _obscurePassword,
                suffixIcon:
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                onSuffixIconTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword; // Cambiamos el estado
                  });
                },
              ),
              const SizedBox(height: 30),
              BlocBuilder<LoginCubit, LoginState>(
                  builder: (BuildContext context, LoginState state) {
                return MainButton(
                  onTap: () {
                    widget.cubit!.canLogin()
                        ? widget.cubit?.login(
                            onSuccess: () => _navigateToHome(context),
                            onError: (Object error) {
                              if (error is AppError) {
                                showDialog(
                                    context: context,
                                    builder: (context) => CustomAlertDialog(
                                          message: error.message,
                                          onConfirm: () =>
                                              Navigator.pop(context),
                                        ));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) => CustomAlertDialog(
                                          message: 'No se pudo iniciar Sesión',
                                          onConfirm: () =>
                                              Navigator.pop(context),
                                        ));
                              }
                            },
                          )
                        : ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: ColorPalette.warning,
                              content: Text(
                                'Faltan datos de acceso',
                                style:
                                    getTextTheme(context).labelMedium!.copyWith(
                                          color: ColorPalette.backGround,
                                        ),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                  },
                  text: 'Login',
                  width: 200,
                  isLoading: state.isLoading,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const HomeProvider()));
  }
}
