import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/gradient.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';
import 'package:food_ninja/ui/styles/default/text_style.dart';
import 'package:food_ninja/ui/widgets/base/button/reverse_primary_button.dart';

class OrderBar extends StatelessWidget {
  static const double _horizontalBottomBarMargin = 14;

  const OrderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle bottomBarTextStyle = defaultTextStyle.copyWith(
        fontSize: 14,
        color: Colors.white,
        height: 1
    );

    return Container(
      height: 206,
      width: MediaQuery.of(context).size.width - _horizontalBottomBarMargin * 2,
      margin: const EdgeInsets.only(
          left: _horizontalBottomBarMargin,
          right: _horizontalBottomBarMargin,
          bottom: 18
      ),
      decoration: BoxDecoration(
        boxShadow: primaryShadow,
        borderRadius: BorderRadius.circular(cardRadius),
        gradient: const LinearGradient(
            colors: primaryGradientColors
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background/order_bar_background.png',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: DefaultTextStyle(
                  style: bottomBarTextStyle,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Sub-Total'),
                          Text('120 \$'),
                        ],
                      ),
                      const SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Charge',),
                          Text('10 \$'),
                        ],
                      ),
                      const SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Discount'),
                          Text('20 \$'),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      DefaultTextStyle(
                        style: bottomBarTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total'),
                            Text('150\$'),
                            // Text('150\$', style: Theme.of(context).,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 9, right: 9, bottom: 12),
                child: ReversePrimaryButton('Place My Order'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
