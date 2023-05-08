import 'package:flutter/material.dart';
import 'package:todo_app/utils/theme/themes.dart';

class Mybutton extends StatelessWidget {
  final     String label;
  final Function ()? onTap;

  const Mybutton({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 80,
        height: 40,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(label,style: buttonTextStyle,),
        ),
        decoration: BoxDecoration(
          color: ligtprimaryColr,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
