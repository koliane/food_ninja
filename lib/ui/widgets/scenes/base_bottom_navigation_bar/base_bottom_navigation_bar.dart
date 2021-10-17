import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';
import 'package:food_ninja/ui/widgets/scenes/base_bottom_navigation_bar/app_bar_item.dart';

class BaseBottomNavigationBar extends StatelessWidget {
  const BaseBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: primaryShadow
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarItem(
            image: 'assets/images/icons/home.svg',
            text: 'Home',
          ),
          AppBarItem(
            image: 'assets/images/icons/profile.svg',
            text: 'Profile',
          ),
          AppBarItem(
            image: 'assets/images/icons/basket.svg',
            text: 'Order',
            withReminder: true,
            reminderCount: 8,
          ),
          AppBarItem(
            image: 'assets/images/icons/chat.svg',
            text: 'Chat',
            isActive: true,
            withReminder: true,
          ),
        ],
      ),
    );
  }
}
