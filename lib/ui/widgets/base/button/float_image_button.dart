import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/widgets/base/button/float_button.dart';

class FloatImageButton extends StatelessWidget {
  final String image;

  const FloatImageButton({
    required this.image,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatButton(
      child: Image.asset(image),
    );
  }
}
