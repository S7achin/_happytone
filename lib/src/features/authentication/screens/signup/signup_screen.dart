import 'package:flutter/material.dart';
import 'package:_happytone/src/common_widgets/form/form_header_widget.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/features/authentication/screens/signup/signup_footer_widget.dart';
import 'package:_happytone/src/features/authentication/screens/signup/signup_form_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(sDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              FormHeaderWidget(
                title: sSignUpTitle,
                subTitle: sSignUpSubTitle,
                image: sWelcomeScreenImage,
              ),
              SignUpFormWidget(),
              SignUpFooterWidget()
            ],
          ),
        )),
      ),
    );
  }
}
