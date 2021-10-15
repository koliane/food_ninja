import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';

class TextInput extends StatelessWidget {


  String? placeholder;

  TextInput({
    Key? key,
    this.placeholder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
            color: Color(outlinedColor),
            width: 1
        )
    );

    return Container(
      height: 57,
      decoration: BoxDecoration(
        boxShadow: primaryShadow
      ),
      child: TextField(
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
          fontSize: 14
        ),

        decoration: InputDecoration(

          fillColor: Colors.white,
          filled: true,
          hintText: this.placeholder,
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 14,
              color: Color(placeholderColor)
              // color: Colors.red
          ),

          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 22),
          // contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 22),
          // contentPadding: EdgeInsets.symmetric(horizontal: 28),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder

        ),
      ),
    );
  }
}
