// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/controllers/signup_controller.dart';
import 'package:_happytone/src/features/authentication/models/database_model/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: sFormHeight - 10),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                  ),
                  label: Text(sFullName),
                ),
              ),
              const SizedBox(
                height: sFormHeight - 15,
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                  label: Text(sEmail),
                ),
              ),
              const SizedBox(
                height: sFormHeight - 15,
              ),
              TextFormField(
                controller: controller.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                  ),
                  label: Text(sPhoneNo),
                ),
              ),
              const SizedBox(
                height: sFormHeight - 15,
              ),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.fingerprint,
                  ),
                  label: Text(sPassword),
                ),
              ),
              const SizedBox(
                height: sFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // SignUpController.instance.registerUser(
                        //     controller.email.text.trim(),
                        //     controller.password.text.trim());
                        if (controller.fullName.text.trim() != "" &&
                            controller.email.text.trim() != "" &&
                            controller.phone.text.trim() != "" &&
                            controller.password.text.trim() != "") {
                          final user = UserModel(
                            fullName: controller.fullName.text.trim(),
                            email: controller.email.text.trim(),
                            phoneNo: controller.phone.text.trim(),
                            password: controller.password.text.trim(),
                            // diary: "",
                          );

                          SignUpController.instance.createUser(user);
                        } else {
                          Get.snackbar("Error", "Plzz fill filled properly",
                              // snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red.withOpacity(.1),
                              colorText: Colors.red);
                        }
                      }
                    },
                    child: Text(sSignup.toUpperCase())),
              ),
            ],
          )),
    );
  }
}
