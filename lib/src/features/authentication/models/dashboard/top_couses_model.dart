import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/image_strings.dart';

class DashboardTopCoursesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;
  final String image;

  DashboardTopCoursesModel(
      this.title, this.heading, this.subHeading, this.onPress, this.image);

  static List<DashboardTopCoursesModel> list = [
    DashboardTopCoursesModel(
        "Flutter Crash Course", "Flutter", "10 Lessons", null, sBannerImage1),
    DashboardTopCoursesModel(
        "MERN Development", "MERN", "11 Lessons", null, sBannerImage2),
    DashboardTopCoursesModel(
        "Python for Beginners", "Python", "8 Lessons", null, sBannerImage3),
    DashboardTopCoursesModel(
        "Advanced JavaScript", "JavaScript", "20 Lessons", null, sBannerImage1),
  ];
}
