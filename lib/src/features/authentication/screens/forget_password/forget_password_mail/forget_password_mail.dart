import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(sDefaultSize),
        child: Column(children: [
          const SizedBox(
            height: sDefaultSize * 4,
          ),
          const FormHeaderWidget(
            title: sForgetPassword,
            subTitle: sForgetPasswordSubTitle,
            textAlign: TextAlign.center,
            image: sForgetPasswordImage,
            crossAxisAlignment: CrossAxisAlignment.center,
            heightBetween: 30.0,
          ),
          const SizedBox(
            height: sFormHeight,
          ),
          Form(
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(sEmail),
                  hintText: sEmail,
                  prefixIcon: Icon(Icons.mail_outline_rounded),
                ),
              ),
              const SizedBox(
                height: sFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const OTPScreen());
                  },
                  child: const Text(sNext),
                ),
              )
            ]),
          )
        ]),
      ),
    )));
  }
}
