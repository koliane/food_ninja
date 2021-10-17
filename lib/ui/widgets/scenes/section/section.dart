import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_ninja/ui/styles/default/color.dart';

class Section extends StatelessWidget {
  final String title;
  final Widget child;
  final String? moreLink;

  const Section({
    required this.title,
    required this.child,
    this.moreLink,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 15
                )
              ),
              moreLink != null
                ? Text('View more',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: const Color(secondaryTextColor)
                    )
                  )
                : const SizedBox.shrink()
            ],
          ),
        ),

        const SizedBox(height: 20,),
        child
      ],
    );
  }
}
