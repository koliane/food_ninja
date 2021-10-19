import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseCounter extends StatelessWidget {
  final double width;
  final double height;
  final int value;

  const BaseCounter({
    this.value = 0,
    this.width = 92,
    this.height = 26,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF53E88B).withOpacity(0.1),
                    const Color(0xFF35D381).withOpacity(0.1),
                    const Color(0xFF15BE77).withOpacity(0.1)
                  ]
              ),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Image.asset('assets/images/icons/minus.png')
          ),
          Expanded(
            child: Text(value.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1
              ),
            ),
          ),
          SvgPicture.asset('assets/images/icons/plus.svg')
        ],
      ),
    );
  }
}
