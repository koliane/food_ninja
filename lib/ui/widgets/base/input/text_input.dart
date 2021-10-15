import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';

class TextInput extends StatelessWidget {

  final String? placeholder;
  final double? prefixCorrectiveLeftOffset;
  final double? prefixCorrectiveTopOffset;
  final String? prefixImage;

  const TextInput({
    this.prefixImage,
    this.prefixCorrectiveLeftOffset,
    this.prefixCorrectiveTopOffset,
    Key? key,
    this.placeholder
  }) : super(key: key);

  bool get _hasPrefixImage => prefixImage != null;

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
      child: Stack(
        children: [
          TextField(
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 14,
              letterSpacing: 0.5
            ),

            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: placeholder,
              hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 14,
                  color: const Color(placeholderColor)
              ),

              contentPadding: _hasPrefixImage
                ? const EdgeInsets.fromLTRB(60,  22, 28, 22)
                : const EdgeInsets.symmetric(horizontal: 28, vertical: 22)
              ,
              border: inputBorder,
              focusedBorder: inputBorder,
              enabledBorder: inputBorder

            ),
          ),
          _hasPrefixImage
              ? Positioned(
                left: 24 + (prefixCorrectiveLeftOffset ?? 0),
                top: 18 + (prefixCorrectiveTopOffset ?? 0),
                child: SvgPicture.asset(prefixImage!),
              )
              : const SizedBox.shrink()
            // child: SvgPicture.asset('assets/images/input/profile.svg'),)
        ],
      ),
    );
  }
}
