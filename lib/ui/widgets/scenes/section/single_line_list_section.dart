import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'section.dart';

class SingleLineListSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final String? moreLink;

  const SingleLineListSection({
    required this.title,
    required this.children,
    this.moreLink,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      moreLink: moreLink,
      child: Expanded(
        child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index){
              final EdgeInsetsGeometry padding = index < children.length - 1
                  ? const EdgeInsets.only(left: 25)
                  : const EdgeInsets.only(left: 25, right: 25)
              ;
              return Container(
                padding: padding,
                child: children[index],
              );
            }
        ),
      ),
    );
  }
}
