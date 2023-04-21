import 'package:get/get.dart';
import 'package:_happytone/src/features/authentication/controllers/auth_controller.dart';

class SFadeInAnimationController extends GetxController {
  static SFadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offAll(() => const AuthPage());
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
