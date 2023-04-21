import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/features/authentication/models/database_model/user_model.dart';
import 'package:_happytone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:_happytone/src/repository/user_repository/user_repository.dart';
// import '../screens/forget_password/forget_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final diary = "";

  final userRepo = Get.put(UserRepository());
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  void phoneAuthentication(UserModel user) {
    AuthenticationRepository.instance.phoneAuthentication(user);
  }

  Future<void> createUser(UserModel user) async {
    // phoneAuthentication(user);
    // Get.to(() => const OTPScreen());
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
  }

  void login(String email, String password) {
    AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
  }
}
