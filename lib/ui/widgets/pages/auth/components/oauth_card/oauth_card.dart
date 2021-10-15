import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';

class OauthCard extends StatelessWidget {
  final SvgPicture image;
  final String text;
  final VoidCallback onPressed;

  const OauthCard({
    required this.image,
    required this.text,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 57,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(outlinedColor),
          ),
          borderRadius: BorderRadius.circular(primaryRadius),
          boxShadow: primaryShadow,
          color: Colors.white
        ),
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            image,
            SizedBox(width: 13,),
            Text(text, style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 14,
              height: 1.4,
              fontWeight: FontWeight.w600
            ), textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }lib/ui/widgets/base/button/primary_button.dart
}
