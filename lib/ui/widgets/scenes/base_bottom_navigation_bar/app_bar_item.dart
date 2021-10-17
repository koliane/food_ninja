import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarItem extends StatelessWidget {
  final bool isActive;
  final String image;
  final String text;
  final bool withReminder;
  final int? reminderCount;

  const AppBarItem({
    required this.image,
    required this.text,
    this.isActive = false,
    this.withReminder = false,
    this.reminderCount,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> payload = [
      getIconWidget(context)
    ];

    if(isActive) {
      payload.addAll([
        const SizedBox(width: 12,),
        Text(text,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w600
          ),
        )
      ]);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      decoration: BoxDecoration(
        gradient:  isActive
            ? LinearGradient(
                colors: [
                  const Color(0xFF53E88B).withOpacity(0.1),
                  const Color(0xFF15BE77).withOpacity(0.1)
                ]
              )
            : null,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          ...payload
        ],
      ),
    );
  }
  
  Widget getIconWidget(context) {
    Widget icon = SvgPicture.asset(image);

    if(!isActive) {
      icon = Opacity(
        opacity: 0.5,
        child: icon,
      );
    }

    if(withReminder) {
      icon = Stack(
        clipBehavior: Clip.none,
        children: [
          icon,
          Positioned(
              top: -5,
              right: -5,
              child: SvgPicture.asset('assets/images/icons/reminder.svg', width: 13,)
          ),
          reminderCount == null || reminderCount == 0 || reminderCount! > 9
              ? const SizedBox.shrink()
              : Positioned(
              top: -9,
              right: -2,
              child: Text(reminderCount.toString(),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold
                ),
              )
          ),
        ],
      );
    }
    
    return icon;
  }
}
