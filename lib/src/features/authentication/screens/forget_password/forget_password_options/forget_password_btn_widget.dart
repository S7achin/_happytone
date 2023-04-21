import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/color.dart';

// import '../../../../../constants/text_strings.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget(
      {Key? key,
      required this.btnIcon,
      required this.title,
      required this.subTitle,
      required this.onTap})
      : super(key: key);

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    var brightness = mediaquery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 40.0,
              color: isDarkMode ? sPrimaryColor : sSecondaryColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
