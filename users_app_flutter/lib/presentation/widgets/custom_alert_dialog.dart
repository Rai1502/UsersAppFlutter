import 'package:flutter/material.dart';
import 'package:users_app_flutter/presentation/constants/color_palette.dart';
import 'package:users_app_flutter/presentation/style/text_theme.dart';
import 'package:users_app_flutter/presentation/widgets/main_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.message,
    this.title = 'Error al iniciar Sesion',
    this.buttonText = 'Aceptar',
    required this.onConfirm,
  });

  final String message;
  final String title;
  final String buttonText;
  final Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text(title),
      content: Text(
        message,
        style: getTextTheme(context)
            .labelLarge
            ?.copyWith(color: ColorPalette.focusedTextField),
      ),
      actions: [
        MainButton(
          onTap: onConfirm,
          text: buttonText,
          width: 100,
        )
      ],
    );
  }
}
