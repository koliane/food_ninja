import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/state/management/state_facade.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final EdgeInsets padding = data.padding;
    final double topPadding = padding.top == 0 ? 38 : 10 + padding.top;

    return Container(
      padding: EdgeInsets.only(
        left: 25,
        top: topPadding
      ),
      child: Navigator.of(context).canPop()
          ? GestureDetector(
              onTap: () {
                StateFacade().route.back();
              },
              child: SvgPicture.asset('assets/images/navigation/back.svg', width: 45,)
            )
          : null,
    );
  }
}
