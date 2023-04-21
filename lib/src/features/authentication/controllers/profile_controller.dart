// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/features/authentication/models/database_model/user_model.dart';
import 'package:_happytone/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:_happytone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:_happytone/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  // Get User Email and pass to UserRepository to fetch user records.

  getUserData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      print("email from getuserdata of profilecontroller $email");
      return await _userRepo.getUserDetails(email);
    } else {
      print("email from getuserdata of profilecontroller $email");
      // Get.snackbar('Error', 'Something went wrong');
      print("You are not logged in.., Plz Login to continue");
    }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecords(user);
    Get.snackbar("Success", "Change saved successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green);
    Get.to(() => const ProfileScreen());
  }
}
