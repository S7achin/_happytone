// import 'dart:math';

import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard%20functions/Todo_List/todo_list.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard%20functions/jokes.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard%20functions/quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard%20functions/chess.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: sDashboardPadding,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(() => const QuizPage()),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: sCardBgColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Flexible(
                                child: Image(
                              image: AssetImage(sTest1),
                            )),
                            Flexible(
                                child: Image(
                              image: AssetImage(sTest2),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: sDashboardPadding,
                        ),
                        Text(
                          sDashboardBannerTitle1,
                          style: txtTheme.labelMedium,
                          // maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Text(
                        //   sDashboardBannerSubTitle,
                        //   style: txtTheme.labelSmall,
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              width: sDashboardPadding,
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => const TodoList()),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: sCardBgColor),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                    child: Image(
                                  image: AssetImage(sDiary1),
                                )),
                                Flexible(
                                    child: Image(
                                  image: AssetImage(sDiary2),
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: sDashboardPadding,
                            ),
                            Text(
                              sDashboardBannerTitle2,
                              style: txtTheme.labelMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // Text(
                            //   sDashboardBannerSubTitle,
                            //   style: txtTheme.labelSmall,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: sDashboardPadding + 10,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(() => const Jokes()),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: sCardBgColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Flexible(
                                child: Image(
                              image: AssetImage(sJokes1),
                            )),
                            Flexible(
                                child: Image(
                              image: AssetImage(sJokes2),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: sDashboardPadding - 9,
                        ),
                        Text(
                          sDashboardBannerTitle3,
                          style: txtTheme.labelMedium,
                          // maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Text(
                        //   sDashboardBannerSubTitle,
                        //   style: txtTheme.labelSmall,
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              width: sDashboardPadding,
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => const Chess()),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: sCardBgColor),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                    child: Image(
                                  image: AssetImage(sGames1),
                                )),
                                Flexible(
                                    child: Image(
                                  image: AssetImage(sGames2),
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: sDashboardPadding + 10,
                            ),
                            Text(
                              sDashboardBannerTitle4,
                              style: txtTheme.labelMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // Text(
                            //   sDashboardBannerSubTitle,
                            //   style: txtTheme.labelSmall,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: sDashboardPadding - 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
