import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/features/authentication/models/onboarding_screen/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(sDefaultSize),
      color: model.bgColor,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image(
          image: AssetImage(model.image),
          height: size.height * 0.5,
        ),
        Column(
          children: [
            Text(
              model.title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              model.subTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Text(
          model.counterText,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 90.0,
        )
      ]),
    );
  }
}
