import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'section.dart';

class VerticalListSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final String? moreLink;
  final EdgeInsets? padding;
  final EdgeInsets? listPadding;

  const VerticalListSection({
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
      child: Padding(
        padding: listPadding ?? const EdgeInsets.symmetric(horizontal: 20),
        child: Builder(
          builder: (BuildContext context) {
            final List<Widget> list = [];

            final int size = children.length;
            for(int i=0; i < size-1; i++) {
              final Widget child = children[i];
              list.add(child);
              list.add(const SizedBox(height: 20,));
            }

            if(size > 0) {
              list.add(children[size - 1]);
            }

            return Column(
              children: [...list]
            );
          },
        ),
      )
    );
  }
}
