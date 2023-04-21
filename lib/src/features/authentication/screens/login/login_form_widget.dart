// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import '../../controllers/signup_controller.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: sFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: sEmail,
                  hintText: sEmail,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: sFormHeight - 15),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.fingerprint),
                    labelText: sPassword,
                    hintText: sPassword,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.remove_red_eye_sharp),
                    )),
              ),
              const SizedBox(height: sFormHeight - 20),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        ForgetPasswordScreen.buildShowModalBottomSheet(context);
                      },
                      child: const Text(sForgetPassword))),
              const SizedBox(
                height: sDefaultSize - 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (controller.email.text.trim() != "" &&
                            controller.password.text.trim() != "") {
                          SignUpController.instance.login(
                              controller.email.text.trim(),
                              controller.password.text.trim());
                        } else {
                          Get.snackbar("Error", "Plzz fill filled properly",
                              backgroundColor: Colors.red.withOpacity(.1),
                              colorText: Colors.red);
                        }
                      }
                    },
                    child: Text(sLogin.toUpperCase())),
              ),
            ],
          ),
        ));
  }
}
