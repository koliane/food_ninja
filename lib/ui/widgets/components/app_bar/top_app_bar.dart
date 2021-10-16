import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 25,
        top: 38
      ),
      child: SvgPicture.asset('assets/images/navigation/back.svg', width: 45,),
    );
  }
}
