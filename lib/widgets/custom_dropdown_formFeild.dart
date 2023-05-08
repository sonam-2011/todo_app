import 'package:flutter/material.dart';
import 'package:todo_app/utils/theme/themes.dart';

import '../utils/text_style.dart';

class CustomDropDownFormButton extends StatefulWidget {
  final String? text;
  final String? dropDownIntialVAlue;
  final String titleText;

  final List<String>? items;
  final TextEditingController? selectedOptionController;
  final String? Function(String?)? validator;
  final Function(String?)? optionalFunction;
  final bool isReadOnly;

  const CustomDropDownFormButton({
    Key? key,
    this.text,
    this.items,
    this.selectedOptionController,
    this.validator,
    this.isReadOnly = true,
    this.optionalFunction,
    this.dropDownIntialVAlue, required this.titleText,
  }) : super(key: key);

  @override
  State<CustomDropDownFormButton> createState() =>
      _CustomDropDownFormButtonState();
}

class _CustomDropDownFormButtonState extends State<CustomDropDownFormButton> {
  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // candidates = loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleText,
          style: titleTextStyle,
        ),
        SizedBox(
          height: 5,
        ),
        DropdownButtonFormField<String>(
          validator: widget.validator,

          // validator: Validators.validateEmpty,
          isExpanded: true,
          //helped to avoid pixel issue
          onSaved: (selectedOption) {
            widget.selectedOptionController?.text = selectedOption ?? "";
            // setState(() {
            //
            // });
          },

          decoration: InputDecoration(

            // label: Text("select the job2 " ?? "no label"),
            // hintText: text,
            labelStyle:labelTextStyle,
            labelText: widget.text,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1,color:ligtprimaryColr),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1,color: ligtprimaryColr),
              borderRadius: BorderRadius.circular(15),
            ),
            errorStyle: MyTextStyle.errorTextStyle,
            border: OutlineInputBorder(

              borderSide: BorderSide(width: 1,color: ligtprimaryColr),
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true,
            // fillColor: Colors.blueAccent,
          ),

          value: widget.dropDownIntialVAlue,
          onTap: () {
            print("on tap executed");
          },
          onChanged: widget.isReadOnly
              ? null
              : (String? newValue) {
            print("on changed executed");
            setState(() {
              selectedValue = newValue!;
              widget.selectedOptionController?.text = newValue ?? "";
              if (widget.optionalFunction != null) {
                widget.optionalFunction!(newValue);
              }
            });
          },
          items: widget.items?.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        items,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}