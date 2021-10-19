import 'package:flutter/material.dart';
import 'package:food_ninja/core/infrastructure/utils/double/double.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';
import 'package:food_ninja/ui/styles/default/text_style.dart';
import 'package:food_ninja/ui/widgets/base/counter/base_counter.dart';
import 'package:food_ninja/ui/widgets/base/text/primary_gradient_text.dart';
import 'package:food_ninja/ui/widgets/components/image_container/card_image_container.dart';

class OrderPositionCard extends StatelessWidget {
  static const double _defaultHeight = 87;

  final String image;
  final String title;
  final String subtitle;
  final double price;

  const OrderPositionCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _defaultHeight,
      padding: const EdgeInsets.fromLTRB(10, 11, 20, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: primaryShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardImageContainer(image: image),
              const SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: defaultTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(subtitle,
                    style: defaultTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(secondaryBlackColor).withOpacity(0.3),
                        height: 1
                    ),
                  ),
                  const SizedBox(height: 8,),
                  PrimaryGradientText('\$ ${Double.toTruncateZeroString(price)}', style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ), ),
                ],
              )
            ],
          ),
          BaseCounter(
            value: 1,
          )



        ],
      ),
    );
  }
}
