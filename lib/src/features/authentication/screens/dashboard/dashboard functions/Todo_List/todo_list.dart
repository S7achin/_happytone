// ignore_for_file: avoid_print

import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/features/authentication/controllers/task_controller.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard%20functions/Todo_List/add_task_bar.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/widgets/task_tile.dart';
import 'package:_happytone/src/services/notification.dart';
import 'package:_happytone/src/services/theme_services.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../../constants/image_strings.dart';
import '../../../../models/database_model/task.dart';
import '../../../profile/profile_screen.dart';
import '../../widgets/button.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});
  @override
  State<TodoList> createState() => _TodoListState();
}

var isDark = ThemeService().checkdark();

final _taskController = Get.put(TaskController());

class _TodoListState extends State<TodoList> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _appBar(),
      body: Column(children: [
        _addTaskBar(txtTheme),
        _addDateBar(),
        const SizedBox(
          height: 10,
        ),
        _showTasks(),
      ]),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              Task task = _taskController.taskList[index];
              print(task.toJson());
              if (task.repeat == 'Daily') {
                DateTime date =
                    DateFormat.jm().parse(task.startTime.toString());
                var myTime = DateFormat("HH:mm").format(date);
                NotificationService().scheduledNotification(
                    int.parse(myTime.toString().split(":")[0]),
                    int.parse(myTime.toString().split(":")[1]),
                    task);
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, task);
                              },
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    ));
              }
              if (task.date == DateFormat.yMd().format(_selectedDate)) {
                // print(
                //     "task date ${task.date} and selected date ${DateFormat.yMd().format(_selectedDate)}");
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, task);
                              },
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    ));
              } else {
                return Container();
              }
            });
      }),
    );
  }

  _addDateBar() {
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
        onDateChange: (date) {
          // print("changing date to $date");
          setState(() {
            _selectedDate = date;
          });
          // print(_selectedDate);
        },
      ),
    );
  }
}

_showBottomSheet(BuildContext context, Task task) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.only(top: 4),
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color: ThemeService().checkdark() ? sDarkGreyClr : Colors.white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDark ? Colors.grey[600] : Colors.grey[300],
            ),
          ),
          const Spacer(),
          task.isCompleted == 1
              ? Container()
              : _bottomSheetButton(
                  label: "Task Completed",
                  onTap: () {
                    _taskController.markTaskCompleted(task.id);
                    Get.back();
                  },
                  clr: sBluishClr,
                  context: context,
                ),
          _bottomSheetButton(
            label: "Delete Task",
            onTap: () {
              _taskController.delete(task);
              // _taskController.getTasks();
              Get.back();
            },
            clr: Colors.red[300]!,
            context: context,
          ),
          const SizedBox(
            height: 20,
          ),
          _bottomSheetButton(
            label: "Close",
            onTap: () {
              Get.back();
            },
            isClose: true,
            clr: Colors.red[300]!,
            context: context,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

_bottomSheetButton({
  required String label,
  required Function()? onTap,
  required Color clr,
  bool isClose = false,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isClose == true ? Colors.grey : clr,
        ),
        borderRadius: BorderRadius.circular(20),
        color: isClose == true ? Colors.transparent : clr,
      ),
      child: Center(
        child: Text(
          label,
          style: isClose
              ? Theme.of(context).textTheme.titleSmall
              : const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
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
              style: txtTheme.headlineSmall!.copyWith(color: Colors.grey),
            ),
            Text(
              "Today",
              style: txtTheme.headlineLarge,
            )
          ],
        ),
        MyButton(
          "+ Add Task",
          () async {
            await Get.to(() => const AddTaskPage());
            _taskController.getTasks();
          },
        )
      ],
    ),
  );
}
