import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'fade_in_animation_controller.dart';

class SFadeInAnimation extends StatelessWidget {
  SFadeInAnimation(
      {Key? key,
      required this.animate,
      required this.durationInMs,
      required this.child})
      : super(key: key);

  final controller = Get.put(SFadeInAnimationController());
  final int durationInMs;
  final SAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => AnimatedPositioned(
          duration: Duration(milliseconds: durationInMs),
          top:
              controller.animate.value ? animate!.topAfter : animate!.topBefore,
          left: controller.animate.value
              ? animate!.leftAfter
              : animate!.leftBefore,
          bottom: controller.animate.value
              ? animate!.bottomAfter
              : animate!.bottomBefore,
          right: controller.animate.value
              ? animate!.rightAfter
              : animate!.rightBefore,
          child: AnimatedOpacity(
              duration: Duration(milliseconds: durationInMs),
              opacity: controller.animate.value ? 1 : 0,
              child: child
              // Image(
              //   image: AssetImage(sSplashTopIcon),
              //   height: 150,
              // ),
              ))),
    );
  }
}
