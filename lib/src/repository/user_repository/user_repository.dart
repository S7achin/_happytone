// ignore_for_file: avoid_print, body_might_complete_normally_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/features/authentication/models/database_model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Store user on FireStore
  Future<void> createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.redAccent);

      print(error.toString());
    });
  }

  // Fetch User details
  Future<UserModel> getUserDetails(String email) async {
    print(email);
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapShot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecords(UserModel user) async {
    // print("user id : ${user.id}");
    // print("user id : ${user.fullName}");
    await _db.collection('Users').doc(user.id).update(user.toJson());
  }
}
