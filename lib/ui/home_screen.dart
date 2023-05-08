import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/services/notification_helper.dart';
import 'package:todo_app/services/theme_services.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';

import '../utils/theme/themes.dart';
import '../widgets/mybutton.dart';
import 'add_task_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var notifyhelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyhelper = NotificationHelper();
    notifyhelper.initializeNotification();
    notifyhelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            buildTaskBar(),
            SizedBox(height: 10,),
            buildHorizontalDatePicker()
          ],
        ),
      ),
    );
  }

  Container buildHorizontalDatePicker() {
    return Container(


              child: DatePicker(
                height: 100,
                width: 80,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                daysCount: 50,
                selectionColor: ligtprimaryColr,
                selectedTextColor: Colors.white,
                deactivatedColor: yellow,

                dateTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                dayTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
                monthTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),

              ));
  }

  Row buildTaskBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: subHeadingTextStyle,
            ),
            Text(
              "Today",
              style: headingTextStyle,
            ),
          ],
        ),
        Mybutton(
          label: 'Add',
          onTap: () {
            Get.to(() => AddTaskPage());

          },
        )
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Get.isDarkMode ? Icon(Icons.nightlight) : Icon(Icons.sunny),
        onPressed: () {
          print(Get.isDarkMode);
          ThemeServices().switchTheme();
          notifyhelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme"
                  : "Activated Dark Theme");
          // notifyhelper.scheduledNotification();
        },
      ),

    );
  }
}
