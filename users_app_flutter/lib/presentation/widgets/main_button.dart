import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLoading;
  final String text;
  final double height;
  final double width;
  final Color textColor;
  final Gradient gradient;
  final double borderRadius;

  const MainButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    required this.text,
    this.height = 50.0,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.borderRadius = 30.0,
    this.gradient = const LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 203, 187, 244),
        Color.fromARGB(255, 97, 37, 175)
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
