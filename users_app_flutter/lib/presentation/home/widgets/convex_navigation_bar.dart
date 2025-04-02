import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:users_app_flutter/presentation/constants/color_palette.dart';

class ConvexNavigationBar extends StatelessWidget {
  const ConvexNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    // final cubit = context.watch<SalesCubit>();
    return ConvexAppBar(
      curveSize: 65,
      style: TabStyle.react,
      elevation: 5,
      shadowColor: ColorPalette.appBar,
      items: const [
        TabItem(
          icon: Icon(
            Icons.person,
            color: ColorPalette.primaryText,
          ),
          title: 'Users',
          isIconBlend: true,
        ),
        TabItem(
          icon: Icon(
            Icons.timer_outlined,
            color: ColorPalette.primaryText,
          ),
          title: 'Proximamente',
          isIconBlend: true,
        ),
      ],
      initialActiveIndex: currentIndex,
      onTap: (int index) {
        onTap.call(index);
      },
      backgroundColor: ColorPalette.backGround,
      color: ColorPalette.secondaryText,
      activeColor: ColorPalette.focusedTextField,
    );
  }
}
