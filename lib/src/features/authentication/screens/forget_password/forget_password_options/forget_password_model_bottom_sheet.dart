import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:_happytone/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';

import '../../../../../constants/sizes.dart';
import '../forget_password_phone/forget_password_phone.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(
            vertical: sDefaultSize, horizontal: sDefaultSize - 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            sForgetPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            sForgetPasswordSubTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: sDefaultSize),
          ForgetPasswordBtnWidget(
            btnIcon: Icons.mail_outline_rounded,
            title: sEmail,
            subTitle: sResetViaEmail,
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const ForgetPasswordMailScreen());
            },
          ),
          const SizedBox(
            height: sDefaultSize,
          ),
          ForgetPasswordBtnWidget(
            btnIcon: Icons.mobile_friendly_outlined,
            title: sPhoneNo,
            subTitle: sResetViaPhone,
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const ForgetPasswordPhoneScreen());
            },
          ),
        ]),
      ),
    );
  }
}
