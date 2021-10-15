import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoLabel extends StatelessWidget {

  final double? width;
  final double? height;

  const LogoLabel({
    this.width,
    this.height,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? containerWidth = width;
    double? containerHeight = height;

    if(containerWidth == null && containerHeight != null) {
      containerWidth = containerHeight;

    } else if(containerWidth != null && containerHeight == null) {
      containerHeight = containerWidth;
    }


    double? logoWidth;
    if(containerWidth != null) {
      logoWidth = containerWidth * 0.58;
    }

    return Container(
      width: containerWidth,
      height: containerHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo/logo.png", width: logoWidth,),
          SvgPicture.asset("assets/images/logo/logo_descriptor.svg",width: containerWidth,)
        ],
      ),
    );
  }
}
