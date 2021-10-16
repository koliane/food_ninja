import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final EdgeInsets padding = data.padding;

    return Container(
      padding: EdgeInsets.only(
        left: 25,
        top: padding.top == 0 ? 38 : 10 + padding.top
      ),
      child: SvgPicture.asset('assets/images/navigation/back.svg', width: 45,),
    );
  }
}
