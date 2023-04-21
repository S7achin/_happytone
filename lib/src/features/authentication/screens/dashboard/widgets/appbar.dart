import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/profile/profile_screen.dart';
// import 'package:happytone/src/repository/authentication_repository/authentication_repository.dart';
import '../../../../../constants/color.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(sAppName, style: Theme.of(context).textTheme.headlineSmall),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: sCardBgColor,
          ),
          child: IconButton(
            onPressed: () {
              Get.to(() => const ProfileScreen());
            },
            icon: const Image(
              image: AssetImage(sUserProfileImage),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
