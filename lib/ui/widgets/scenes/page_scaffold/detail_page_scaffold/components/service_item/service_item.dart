import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';

class ServiceItem extends StatelessWidget {
  final String image;
  final String text;

  const ServiceItem({
    required this.image,
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 8,),
          Text(text,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1,
                color: const Color(secondaryBlackColor).withOpacity(0.3)
            ),
          )
        ],
      ),
    );
  }
}
