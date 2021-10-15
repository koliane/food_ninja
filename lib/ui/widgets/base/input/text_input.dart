import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';

class TextInput extends StatelessWidget {


  final String? placeholder;

  const TextInput({
    Key? key,
    this.placeholder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(outlinedColor),
        )
    );

    return Container(
      height: 57,
      decoration: const BoxDecoration(
        boxShadow: primaryShadow
      ),
      child: TextField(
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
          fontSize: 14
        ),

        decoration: InputDecoration(

          fillColor: Colors.white,
          filled: true,
          hintText: placeholder,
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 14,
              color: const Color(placeholderColor)
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder

        ),
      ),
    );
  }
}
