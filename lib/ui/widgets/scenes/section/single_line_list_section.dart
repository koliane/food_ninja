import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'section.dart';

class SingleLineListSection extends StatelessWidget {
  static const double _defaultBetweenPadding = 25;

  final String title;
  final List<Widget> children;
  final String? moreLink;
  final EdgeInsets? padding;
  final EdgeInsets? listPadding;

  const SingleLineListSection({
    required this.title,
    required this.children,
    this.moreLink,
    this.padding,
    this.listPadding,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      moreLink: moreLink,
      padding: padding,
      child: Expanded(
        child: Padding(
          padding: listPadding ?? const EdgeInsets.only(left: 25, right: 25),
          child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: children.length,
              itemBuilder: (BuildContext context, int index){

                final EdgeInsetsGeometry padding = index > 0
                  ? const EdgeInsets.only(left: _defaultBetweenPadding)
                  : EdgeInsets.zero
                ;

                return Container(
                  // padding: resultPadding,
                  padding: padding,
                  child: children[index],
                );
              }
          ),
        ),
      ),
    );
  }

  // EdgeInsets buildPadding() {
  //   if(padding == null) {
  //     return const EdgeInsets.only(left: 25, right: 25);
  //   }
  //
  //   final double leftPaddingValue = padding!.left == 0 ? _defaultHorizontalPadding : padding!.left;
  //   final double rightPaddingValue = padding!.right == 0 ? _defaultHorizontalPadding : padding!.right;
  //
  //   return EdgeInsets.only(left: leftPaddingValue, right: rightPaddingValue);
  // }
}
