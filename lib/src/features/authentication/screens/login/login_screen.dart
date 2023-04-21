import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:_happytone/src/features/authentication/screens/login/login_form_widget.dart';

import '../../../../common_widgets/form/form_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  title: sLoginTitle,
                  subTitle: sLoginSubTitle,
                  image: sWelcomeScreenImage,
                ),
                LoginForm(),
                LoginFooterWidget(),
              ]),
        ),
      )),
    );
  }
}
