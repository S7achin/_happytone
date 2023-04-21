import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:_happytone/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SFadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SFadeInAnimation(
              durationInMs: 1600,
              animate: SAnimatePosition(
                topAfter: 10,
                topBefore: -30,
                leftAfter: 10,
                leftBefore: -30,
              ),
              child: const Image(
                image: AssetImage(sSplashTopIcon),
                height: 120,
              ),
            ),
            // SFadeInAnimation(
            //   durationInMs: 2000,
            //   animate: SAnimatePosition(
            //       topBefore: 140,
            //       topAfter: 140,
            //       leftAfter: sDefaultSize,
            //       leftBefore: -80),
            //   child:
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 140,
                left: controller.animate.value ? sDefaultSize : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: controller.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sAppName,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(sAppTagLine,
                          style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ),
              ),
            ),
            // ),
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  bottom: controller.animate.value ? 80 : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: controller.animate.value ? 1 : 0,
                    child: const Image(
                      image: AssetImage(sSplashImage),
                      height: 400,
                    ),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 2400),
                  bottom: controller.animate.value ? 60 : 0,
                  right: sDefaultSize,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 2400),
                    opacity: controller.animate.value ? 1 : 0,
                    child: Container(
                      width: sSplashContainerSize,
                      height: sSplashContainerSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: sPrimaryColor,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
