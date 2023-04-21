import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/features/authentication/models/dashboard/top_couses_model.dart';

class TopCoursesWidget extends StatelessWidget {
  const TopCoursesWidget({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardTopCoursesModel.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: sCardBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              list[index].title,
                              style: txtTheme.labelMedium
                                  ?.apply(fontSizeFactor: 1.2),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Image(
                              image: AssetImage(list[index].image),
                              height: 90,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: sDarkColor,
                              foregroundColor: sWhiteColor,
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.play_arrow,
                            ),
                          ),
                          const SizedBox(
                            width: sDashboardCardPadding,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index].heading,
                                style: txtTheme.labelSmall?.apply(
                                    fontWeightDelta: 3, fontSizeFactor: 1.3),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                list[index].subHeading,
                                style: txtTheme.labelSmall,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
