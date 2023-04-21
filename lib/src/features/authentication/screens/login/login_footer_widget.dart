import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:_happytone/src/services/auth_services.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: sDefaultSize - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(
                  sGoogleLogoImage,
                ),
                width: 20,
              ),
              onPressed: () {
                AuthService().signInWithGoogle();
              },
              label: const Text(sSignInWithGoogle)),
        ),
        const SizedBox(
          height: sDefaultSize - 20,
        ),
        TextButton(
          onPressed: () => Get.to(() => const SignUpScreen()),
          child: Text.rich(TextSpan(
              text: sDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                    text: sSignup.toUpperCase(),
                    style: const TextStyle(color: Colors.blue)),
              ])),
        )
      ],
    );
  }
}
