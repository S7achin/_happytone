// ignore_for_file: avoid_print

/*
  ===================
    Todo: Step - 1 [Create Model]
  ===================
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  // final String diary;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
    // required this.diary
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      // "Diary": diary,
    };
  }

  // Fetch the data
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      phoneNo: data["Phone"],
      password: data["Password"],
      // diary: data["Diary"]
    );
  }
}
