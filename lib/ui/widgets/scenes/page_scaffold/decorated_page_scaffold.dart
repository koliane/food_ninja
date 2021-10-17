import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class DecoratedPageScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Function? init;
  final bool? resizeToAvoidBottomInset;
  final bool showBottomAppBar;
  final List<Widget>? positionedChildren;

  const DecoratedPageScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.init,
    this.resizeToAvoidBottomInset,
    this.showBottomAppBar = false,
    this.positionedChildren,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = getBody(context);

    if(positionedChildren != null) {
      body = Stack(
        children: [
          body,
          ...positionedChildren!
        ],
      );
    }

    return PageScaffold(
      showBottomAppBar: showBottomAppBar,
      init: init,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: body,
    );
  }

  Widget getBody(BuildContext context) {
    return ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
              children: [
                Positioned(
                  top: -580,
                  right: -250,
                  child: Transform.rotate(
                    angle: 20 * math.pi / 180,
                    child: Image.asset(
                      'assets/images/background/background_pattern.png',
                      width: 500,
                    ),
                  ),
                ),

                body,
              ]
          )
        ]
    );
  }
}