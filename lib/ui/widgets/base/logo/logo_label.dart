import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoLabel extends StatelessWidget {
  const LogoLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/logo/logo.png", width: 120,),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset("assets/images/logo/logo_descriptor.svg")
        )
      ],
    );
  }
}
