import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/widgets/base/button/secondary_button.dart';

class Tag extends StatelessWidget {
  final String text;
  final VoidCallback? action;

  const Tag(this.text, {
    this.action,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = action == null
      ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
      : const EdgeInsets.fromLTRB(20, 8, 15, 8)
    ;

    return SecondaryButton(
      height: 44,
      padding: padding,
      child: getPayload(context)
    );
  }
  
  Widget getPayload(BuildContext context) {
    Widget payload = Text(text,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
          color: const Color(secondaryTextColor2),
          fontWeight: FontWeight.w600,
          height: 1
      ),
    );

    if(action != null) {
      payload = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          payload,
          const SizedBox(width: 5,),
          SvgPicture.asset('assets/images/icons/close.svg', width: 20,)
        ],
      );
    }
    
    return payload;
  }
}
