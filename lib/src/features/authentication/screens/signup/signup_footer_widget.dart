import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/login/login_screen.dart';
import 'package:_happytone/src/services/auth_services.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final GoogleSignIn googleSignIn = GoogleSignIn();

    return Column(
      children: [
        const Text("OR"),
        const SizedBox(
          height: sFormHeight - 20,
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
              label: const Text(sSignUPWithGoogle)),
        ),
        const SizedBox(
          height: sFormHeight - 20,
        ),
        TextButton(
          onPressed: () => Get.to(() => const LoginScreen()),
          child: Text.rich(TextSpan(
              text: sAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                    text: sLogin.toUpperCase(),
                    style: const TextStyle(color: Colors.blue)),
              ])),
        )
      ],
    );
  }
}
