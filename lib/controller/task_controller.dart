import 'package:get/get.dart';
import 'package:todo_app/db/db_helper.dart';

import '../models/task_model.dart';

class TaskController extends GetxController{
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  Future<int> addTaskToDb({required Task task}) async {
    return await DbHelper.insert(task: task);
  }
}