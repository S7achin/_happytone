// ignore_for_file: avoid_print, unnecessary_this

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/features/authentication/controllers/signup_controller.dart';
import 'package:_happytone/src/features/authentication/models/database_model/user_model.dart';
import 'package:_happytone/src/features/authentication/screens/welcome/welcome_screen.dart';
import '../../features/authentication/screens/dashboard/dashboard.dart';
import '../user_repository/user_repository.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  final userRepo = Get.put(UserRepository());
  final controller = Get.put(SignUpController());

  @override
  void onReady() {
    // Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
  }

  // _setInitialScreen(User? user) {
  //   print("running set initial screen");
  //   user == null
  //       ? Get.offAll(() => const SplashScreen())
  //       : Get.offAll(() => const Dashboard());
  // }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const Welcome());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      throw ex;
    }
  }

  // Func
  Future<void> phoneAuthentication(UserModel user) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91${user.phoneNo}",
      verificationCompleted: (credential) async {
        print("Creating Userr $credential");
        await _auth.signInWithCredential(credential);
        // await userRepo.createUser(user);
        // controller.registerUser(user.email, user.password);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid');
        } else {
          Get.snackbar('Error ${e.code}', 'Something went wrong. Try again');
        }
      },
      codeSent: ((verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      }),
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    // var credentials = PhoneAuthProvider.credential(
    //     verificationId: this.verificationId.value, smsCode: otp);
    print(credentials);

    return credentials.user != null ? true : false;
    // return true;
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const Dashboard());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar("Invalid Login Credentials", "Please Verify!!!",
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar("Invalid Login Credentials", "Please Verify!!!",
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red);
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(() => const Welcome());
  }
}
