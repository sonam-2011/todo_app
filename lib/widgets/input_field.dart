import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/widgets/validators.dart';

import '../utils/text_style.dart';
import '../utils/theme/themes.dart';

class InputField extends StatelessWidget {
  final String? text;
  final String titleText;

  final IconData? assets;
  final IconData? prefixAsset;
  final bool? isPassword;
  final bool? isNumeric;
  final bool? isPhoneNum;
  final bool isPincode;
  final FormFieldValidator<String> validator;
  final TextEditingController? controller;
  final bool isPasswordField;
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final Function(String)? onSaved;
  final Function(String)? onChangedFunc;
  final VoidCallback? onTap;
  final int maxLines;

  const InputField({
    Key? key,
    this.text,
    this.assets,
    this.controller,
    this.isPasswordField = false,
    this.textInputType = TextInputType.text,
    this.validator = Validators.validateTEmpty,
    this.textInputAction,
    this.onSaved,
    this.isPassword,
    this.isNumeric,
    this.isPhoneNum,
    this.onTap,
    this.maxLines = 1,
    this.prefixAsset,
    this.onChangedFunc,
    this.isPincode = false,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: titleTextStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            onFieldSubmitted: (val) {
              print("on onFieldSubmitted executed");
            },
            onEditingComplete: () {
              print("on editing executed");
            },

            onChanged: onChangedFunc,
            // onSaved: ,
            // cursorHeight: 18,
            textInputAction: textInputAction,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                // fontFamily: Fonts.robotoRegular,
                fontWeight: FontWeight.normal),

            onTap: onTap!,
            validator: validator,
            keyboardType:
                isNumeric! ? TextInputType.number : TextInputType.text,
            obscureText: isPasswordField,
            controller: controller,
            maxLength: isPhoneNum!
                ? 10
                : isPincode
                    ? 6
                    : null,
            textAlign: TextAlign.start,
            maxLines: maxLines,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(width: 1, color: ligtprimaryColr),
              ),

              errorStyle: MyTextStyle.errorTextStyle,
              // prefixIcon: ,
              // label: Text(text ?? "no label"),
              hintText: text,
              labelStyle: MyTextStyle.labelText,
              contentPadding: const EdgeInsets.only(left: 10.0),
              hintStyle: MyTextStyle.hintTextStyle,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 2,
                minHeight: 2,
              ),

              suffixIconColor: Colors.deepOrange,

              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(assets, color: Colors.grey.shade500),
              ),
              // prefixIcon: Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: Icon(prefixAsset, color: Colors.grey.shade500),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
