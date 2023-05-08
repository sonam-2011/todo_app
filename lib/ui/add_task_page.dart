import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/widgets/mybutton.dart';

import '../constants/app_strings.dart';
import '../models/task_model.dart';
import '../utils/theme/themes.dart';
import '../widgets/custom_date_input_field.dart';
import '../widgets/custom_dropdown_formFeild.dart';
import '../widgets/input_field.dart';
import '../widgets/validators.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController taskController = Get.put(TaskController());
  DateTime _currentDate = DateTime.now();
  String endTime = "9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int remind = 5;
  List<String> reminderList = ["5", "10", "15", "20"];
  List<String> repeatList = ["1", "2", "3", "4"];
  int selectedColor = 0;
  GlobalKey<FormState>? formKey;

  TextEditingController title = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController strtTime = TextEditingController();
  TextEditingController endTimee = TextEditingController();
  TextEditingController reminderController = TextEditingController();
  TextEditingController repeatController = TextEditingController();

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    formKey = GlobalKey<FormState>();
    // rfId = widget.ticket.rfId;
  }

  createTask() {
    if (!formKey!.currentState!.validate()) {
      Get.snackbar(
        "Required",
        "All Feilds are required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ligtprimaryColr,
      );
      print("here");
      return;
    }

    formKey?.currentState!.save();
    _addTaskToDb();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "Add Task",
                style: subHeadingTextStyle,
              ),
              InputField(
                onTap: () {},
                textInputAction: TextInputAction.next,
                onSaved: (v) => title.text = v,
                isNumeric: false,
                isPhoneNum: false,
                isPasswordField: false,
                controller: title,
                validator: Validators.validateEmpty,
                text: AppStrings.title,
                titleText: 'Title',
              ),
              SizedBox(
                height: 8,
              ),
              InputField(
                onTap: () {},
                textInputAction: TextInputAction.next,
                onSaved: (v) => notes.text = v,
                isNumeric: false,
                isPhoneNum: false,
                isPasswordField: false,
                controller: notes,
                validator: Validators.validateEmpty,
                text: AppStrings.notes,
                titleText: 'Notes',
              ),
              SizedBox(
                height: 8,
              ),
              CustomDateInputField(
                isReadOnly: false,
                labelText: "",
                controller: date,
                saveDateFuncForApi: (va) {
                  date.text = va;
                },
                titleText: 'Date',
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      assets: Icons.timer,

                      onTap: () async {
                        pickTime(istartTime: true);
                      },
                      // textInputAction:
                      // TextInputAction.next,
                      onSaved: (v) => strtTime.text = v,
                      isNumeric: false,
                      isPhoneNum: false,
                      isPasswordField: false,
                      controller: strtTime,
                      validator: Validators.validateEmpty,
                      text: startTime,
                      titleText: 'Start Time',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: InputField(
                      assets: Icons.timer,
                      onTap: () async {
                        pickTime(istartTime: false);
                      },
                      textInputAction: TextInputAction.next,
                      onSaved: (v) => endTimee.text = v,
                      isNumeric: false,
                      isPhoneNum: false,
                      isPasswordField: false,
                      controller: endTimee,
                      validator: Validators.validateEmpty,
                      text: endTime,
                      titleText: 'End Time',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CustomDropDownFormButton(
                isReadOnly: false,
                items: reminderList,
                selectedOptionController: reminderController,
                titleText: 'Reminder',
              ),
              SizedBox(
                height: 8,
              ),
              CustomDropDownFormButton(
                isReadOnly: false,
                items: repeatList,
                selectedOptionController: repeatController,
                text: "None",
                titleText: 'Repeat',
              ),
              SizedBox(
                width: 8,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Color",
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      children: List<Widget>.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: index == 0
                                  ? ligtprimaryColr
                                  : index == 1
                                      ? darkPrimaryColor
                                      : Colors.blue,
                              child: selectedColor == index
                                  ? Icon(Icons.done)
                                  : Container(),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Mybutton(
                      label: 'Create Task',
                      onTap: createTask,
                    ),
                  ],
                )
              ])
            ],
          ),
        ),
      )),
    );
  }

  Future<void> pickTime({required bool istartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null && istartTime == true) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = DateFormat('HH:mm a').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      setState(() {
        strtTime.text = formattedTime; //set the value of text field.
      });
    } else if (pickedTime != null && istartTime == false) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = DateFormat('HH:mm a').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      setState(() {
        endTimee.text = formattedTime; //set the value of text field.
      });
    }
  }

  Future<void> _addTaskToDb() async {
    int value = await taskController.addTaskToDb(
        task: Task(
      title: title.text,
      note: notes.text,
      date: date.text,
      startTime: strtTime.text,
      endTime: endTimee.text,
      repeat: repeatController.text,
      remind: int.parse(reminderController.text),
      isCompleted: 0,
      color: selectedColor,
    ));
    print("My Value");
    print(value);
  }
}
