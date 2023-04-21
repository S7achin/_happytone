import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/sizes.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.imageColor,
      this.imageHeight = 0.25,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.heightBetween,
      this.textAlign})
      : super(key: key);

  final String image, title, subTitle;
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: size * imageHeight,
        ),
        const SizedBox(
          height: sDefaultSize - 20,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          subTitle,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
