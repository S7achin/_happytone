import 'dart:js';

import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/features/authentication/controllers/task_controller.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard%20functions/Todo_List/add_task_bar.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../../constants/image_strings.dart';
import '../../../profile/profile_screen.dart';
import '../../widgets/button.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _appBar(),
      body: Column(children: [
        _addTaskBar(txtTheme),
        _addDateBar(_selectedDate),
        _showTasks(),
      ]),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, context) {
              print(_taskController.taskList.length);
              return Container(
                width: 100,
                height: 50,
                color: Colors.green,
              );
            });
      }),
    );
  }
}

_addDateBar(DateTime _selectedDate) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20),
    child: DatePicker(
      DateTime.now(),
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor: sBluishClr,
      selectedTextColor: Colors.white,
      dateTextStyle: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
      dayTextStyle: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
      monthTextStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
      onDateChange: (date) => _selectedDate = date,
    ),
  );
}

_appBar() {
  return AppBar(
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(LineAwesomeIcons.angle_left),
    ),
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 20, top: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: sCardBgColor,
        ),
        child: IconButton(
          onPressed: () {
            Get.to(() => const ProfileScreen());
          },
          icon: const Image(
            image: AssetImage(sUserProfileImage),
          ),
        ),
      ),
    ],
  );
}

_addTaskBar(TextTheme txtTheme) {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: txtTheme.headlineSmall,
            ),
            Text(
              "Today",
              style: txtTheme.headlineLarge,
            )
          ],
        ),
        MyButton(
          "+ Add Task",
          () => Get.to(() => const AddTaskPage()),
        )
      ],
    ),
  );
}
