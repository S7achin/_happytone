import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/features/authentication/models/dashboard/categories_model.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 170,
            height: 50,
            child: Row(children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: sDarkColor,
                ),
                child: Center(
                  child: Text(
                    list[index].title,
                    style: txtTheme.titleLarge?.apply(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      list[index].heading,
                      style: txtTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      list[index].subHeading,
                      style: txtTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        // children: [
        //   SizedBox(
        //     width: 170,
        //     height: 50,
        //     child: Row(children: [
        //       Container(
        //         width: 45,
        //         height: 45,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: sDarkColor,
        //         ),
        //         child: Center(
        //           child: Text(
        //             "JS",
        //             style: txtTheme.headline6?.apply(color: Colors.white),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         width: 5,
        //       ),
        //       Flexible(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Java Script",
        //               style: txtTheme.headline5,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //             Text(
        //               "10 Lessons",
        //               style: txtTheme.bodyText2,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ]),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 50,
        //     child: Row(children: [
        //       Container(
        //         width: 45,
        //         height: 45,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: sDarkColor,
        //         ),
        //         child: Center(
        //           child: Text(
        //             "JS",
        //             style: txtTheme.headline6?.apply(color: Colors.white),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         width: 5,
        //       ),
        //       Flexible(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Java Script",
        //               style: txtTheme.headline5,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //             Text(
        //               "10 Lessons",
        //               style: txtTheme.bodyText2,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ]),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 50,
        //     child: Row(children: [
        //       Container(
        //         width: 45,
        //         height: 45,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: sDarkColor,
        //         ),
        //         child: Center(
        //           child: Text(
        //             "JS",
        //             style: txtTheme.headline6?.apply(color: Colors.white),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         width: 5,
        //       ),
        //       Flexible(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Java Script",
        //               style: txtTheme.headline5,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //             Text(
        //               "10 Lessons",
        //               style: txtTheme.bodyText2,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ]),
        //   ),
        // ],
      ),
    );
  }
}
