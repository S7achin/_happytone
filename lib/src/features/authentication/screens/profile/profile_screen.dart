// ignore_for_file: unused_import

import 'package:_happytone/src/features/authentication/db/db_helper.dart';
import 'package:_happytone/src/services/notification.dart';
import 'package:_happytone/src/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/profile/functions/user_management.dart';
import 'package:_happytone/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:_happytone/src/features/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = ThemeService().checkdark() == true;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(
            sProfile,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  ThemeService().switchTheme();
                  NotificationService().showNotification(
                    title: "Theme Changed",
                    body: isDark
                        ? "Activated Light Theme"
                        : "Activated Dark Theme",
                  );
                  // NotificationService().scheduledNotification();
                },
                icon: Icon(
                    isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(sDefaultSize),
            child: Column(children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(sProfileImage))),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: sPrimaryColor,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                sProfileHeading,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                sProfileSubHeading,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sPrimaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    sEditProfile,
                    style: TextStyle(color: sDarkColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // --Menu
              ProfileMenuWidget(
                icon: LineAwesomeIcons.cog,
                title: sMenu1,
                onPress: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.wallet,
                title: sMenu2,
                onPress: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.user_check,
                title: sMenu3,
                onPress: () => Get.to(() => UserManagement()),
              ),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.info,
                title: sMenu4,
                onPress: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.alternate_sign_out,
                title: sMenu5,
                textColor: Colors.red,
                onPress: () => AuthenticationRepository.instance.logout(),
                endIcon: false,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
