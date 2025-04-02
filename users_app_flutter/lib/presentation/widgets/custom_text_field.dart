import 'package:flutter/material.dart';
import 'package:users_app_flutter/presentation/constants/color_palette.dart';
import 'package:users_app_flutter/presentation/style/text_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconTap; // Añadir esta línea
  final bool? enable;

  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSuffixIconTap,
    this.enable, // Añadir esto
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: !(enable ?? false),
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: getTextTheme(context).bodyMedium?.copyWith(
          color: ColorPalette.primaryText, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        prefixIconColor: ColorPalette.focusedTextField,
        suffixIconColor: ColorPalette.focusedTextField,
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorPalette.hints),
        labelStyle: const TextStyle(color: ColorPalette.focusedTextField),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: ColorPalette.focusedTextField)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: ColorPalette.focusedTextField, width: 2)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.yellow)),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixIconTap, // Añadir esta línea
                child: Icon(suffixIcon),
              )
            : null,
      ),
    );
  }
}
