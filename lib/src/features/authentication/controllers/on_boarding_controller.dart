import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/models/onboarding_screen/on_boarding_model.dart';
import 'package:_happytone/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: sOnBoardingImage1,
            title: sOnBoardingTitle1,
            subTitle: sOnBoardingSubTitle1,
            counterText: sOnBoardingCounter1,
            bgColor: sOnBoardingPage1Color)),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: sOnBoardingImage2,
            title: sOnBoardingTitle2,
            subTitle: sOnBoardingSubTitle2,
            counterText: sOnBoardingCounter2,
            bgColor: sOnBoardingPage2Color)),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: sOnBoardingImage3,
            title: sOnBoardingTitle3,
            subTitle: sOnBoardingSubTitle3,
            counterText: sOnBoardingCounter3,
            bgColor: sOnBoardingPage3Color)),
  ];

  void onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() => controller.jumpToPage(page: 2);

  void animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
