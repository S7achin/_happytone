import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/widgets/appbar.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/widgets/banner.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/widgets/categories.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/widgets/search.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/widgets/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: const DashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(sDashboardPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Heading
              Text(
                sDashboardTitle,
                style: txtTheme.titleSmall,
              ),
              Text(
                sDashboardHeading,
                style: txtTheme.headlineLarge,
              ),
              const SizedBox(
                height: sDashboardPadding,
              ),

              // Search Box
              // SearchBoxWidget(txtTheme: txtTheme),
              // const SizedBox(
              //   height: sDashboardPadding,
              // ),

              // Categories
              // DashboardCategories(txtTheme: txtTheme),
              // const SizedBox(
              //   height: sDashboardPadding,
              // ),

              // Banner
              BannerWidget(txtTheme: txtTheme),
              const SizedBox(
                height: sDashboardPadding,
              ),

              // Top Courses
              // Text(
              //   sDashboardTopCourses,
              //   style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2),
              // ),
              // TopCoursesWidget(txtTheme: txtTheme),
            ]),
          ),
        ),
      ),
    );
  }
}
