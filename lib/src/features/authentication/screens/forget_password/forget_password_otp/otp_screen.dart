// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp;
    // ignore: unused_local_variable
    final controller = Get.put(OTPControllerPhone());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(sDefaultSize),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                sOtpTitle,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 80.0),
              ),
              Text(
                sOtpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "$sOtpMessage support@codingwithsacchu.com",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(.1),
                filled: true,
                onSubmit: (code) {
                  otp = code;
                  // OTPControllerPhone.instance.verifyOTP(otp);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => OTPControllerPhone.instance.verifyOTP(otp),
                    child: const Text(sNext)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
