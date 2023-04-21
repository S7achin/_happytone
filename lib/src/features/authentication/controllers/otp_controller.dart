import 'package:get/get.dart';
// import 'package:happytone/src/features/authentication/screens/dashboard/dashboard.dart';
// import 'package:happytone/src/repository/authentication_repository/authentication_repository.dart';

class OTPControllerPhone extends GetxController {
  static OTPControllerPhone get instance => Get.find();

  void verifyOTP(String otp) {
    // print(otp);
    // var isVerified = AuthenticationRepository.instance.verifyOTP(otp);
    // print(isVerified);
    // await isVerified ? Get.offAll(() => const Dashboard()) : Get.back();
  }
}
