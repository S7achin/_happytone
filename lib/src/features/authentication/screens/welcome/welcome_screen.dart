import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:_happytone/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/login/login_screen.dart';
import 'package:_happytone/src/features/authentication/screens/signup/signup_screen.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../services/theme_services.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SFadeInAnimationController());
    controller.startAnimation();

    var mediaquery = MediaQuery.of(context);
    var height = mediaquery.size.height;
    var brightness = mediaquery.platformBrightness;
    final isDarkMode = ThemeService().checkdark() == true;

    return Scaffold(
      backgroundColor: isDarkMode ? sSecondaryColor : sPrimaryColor,
      // backgroundColor: sPrimaryColor,
      body: Stack(
        children: [
          SFadeInAnimation(
            durationInMs: 1200,
            animate: SAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                leftAfter: 0,
                leftBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
                topAfter: 0,
                topBefore: 0),
            child: Container(
              padding: const EdgeInsets.all(sDefaultSize),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: const AssetImage(sWelcomeScreenImage),
                      height: height * 0.5,
                    ),
                    Column(
                      children: [
                        Text(
                          sWelcomeTitle,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          sWelcomeSubTitle,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () =>
                                  Get.to(() => const LoginScreen()),
                              child: Text(sLogin.toUpperCase())),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () =>
                                  Get.to(() => const SignUpScreen()),
                              child: Text(sSignup.toUpperCase())),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
