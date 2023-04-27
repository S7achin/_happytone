// ignore_for_file: unnecessary_overrides, unnecessary_new
import 'package:_happytone/src/features/authentication/db/db_helper.dart';
import 'package:get/get.dart';
import '../models/database_model/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  Future<void> delete(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  Future<void> markTaskCompleted(int? id) async {
    await DBHelper.update(id!);
    getTasks();
  }
}
