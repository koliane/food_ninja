import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/application/settings/settings.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';

class BaseTextInput extends StatelessWidget {
  static const double _defaultHeight = 57;
  static const double _defaultPrefixLeftOffset = 24;
  static const double _defaultPrefixTopOffset = 18;
  static const double _defaultBorderRadius = 15;


  final String? placeholder;
  final TextStyle? placeholderTextStyle;
  final Offset? prefixCorrectiveOffset;
  final String? prefixImage;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Offset? prefixOffset;
  final double borderRadius;
  final String? title;
  final Offset? titleOffset;
  final TextStyle? textStyle;
  final bool obscureText;
  final Color? fillColor;
  final String? initialValue;
  final ValueChanged<String>? onChanged;


  const BaseTextInput({
    this.title,
    this.titleOffset,
    this.prefixImage,
    this.padding,
    this.prefixOffset,
    this.prefixCorrectiveOffset,
    this.borderRadius = _defaultBorderRadius,
    this.height = _defaultHeight,
    this.textStyle,
    this.obscureText = false,
    this.placeholder,
    this.placeholderTextStyle,
    this.fillColor,
    this.initialValue,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  bool get _hasPrefixImage => prefixImage != null;
  bool get _hasTitle => title != null && title!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(
          color: Color(outlinedColor),
        )
    );

    final double prefixCorrectiveLeftOffset = prefixCorrectiveOffset == null ? 0 : prefixCorrectiveOffset!.dx;
    final double prefixCorrectiveTopOffset = prefixCorrectiveOffset == null ? 0 : prefixCorrectiveOffset!.dy;

    final double prefixLeftOffset = prefixOffset == null ? _defaultPrefixLeftOffset : prefixOffset!.dx;
    final double prefixTopOffset = prefixOffset == null ? _defaultPrefixTopOffset : prefixOffset!.dy;

    final double titleLeftOffset = titleOffset == null ? 0 : titleOffset!.dx;
    final double titleTopOffset = titleOffset == null ? 0 : titleOffset!.dy;

    final defaultContentPadding = _hasPrefixImage
        ? const EdgeInsets.fromLTRB(60,  22, 28, 22)
        : const EdgeInsets.symmetric(horizontal: 28, vertical: 22);
    final contentPadding = padding ?? defaultContentPadding;

    return Container(
      height: height,
      decoration: const BoxDecoration(
        boxShadow: primaryShadow,
      ),
      child: Stack(
        children: [
          TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            style: textStyle ?? Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 14,
              letterSpacing: 0.5
            ),
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: fillColor ?? Colors.white,
              filled: true,
              hintText: placeholder,
              hintStyle: placeholderTextStyle ?? Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 14,
                  color: const Color(placeholderColor)
              ),

              contentPadding: contentPadding,
              border: inputBorder,
              focusedBorder: inputBorder,
              enabledBorder: inputBorder

            ),
          ),
          _hasPrefixImage
              ? Positioned(
                left: prefixLeftOffset + prefixCorrectiveLeftOffset ,
                top: prefixTopOffset + prefixCorrectiveTopOffset,
                child: SvgPicture.asset(prefixImage!),
              )
              : const SizedBox.shrink()
          ,
          _hasTitle
            ? Positioned(
                left: titleLeftOffset ,
                top: titleTopOffset,
                child: Text(title!, style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(placeholderColor2),
                  package: projectName
                )),
              )
            : const SizedBox.shrink()
        ],
      ),
    );
  }
}
