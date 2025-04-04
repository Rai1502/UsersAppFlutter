import 'package:flutter/material.dart';
import 'package:users_app_flutter/domain/models/user.dart';
import 'package:users_app_flutter/presentation/constants/color_palette.dart';
import 'package:users_app_flutter/presentation/style/text_theme.dart';

class UsersTile extends StatelessWidget {
  const UsersTile({super.key, required this.user});

  final Users user;

  @override
  Widget build(BuildContext context) {
    final style = getTextTheme(context).labelMedium;
    return Container(
        decoration: BoxDecoration(
            color: ColorPalette.usersBackGround.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Id: ${user.id}',
                  style: style,
                ),
                Text(
                  user.name,
                  style: style,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  user.userName,
                  style: style,
                ),
                Text(
                  user.phone,
                  style: style,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  user.email,
                  style: style,
                ),
                Text(
                  user.webSite,
                  style: style,
                ),
              ],
            ),
          ],
        ));
  }
}
