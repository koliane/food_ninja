import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';
import 'package:food_ninja/ui/widgets/components/image_container/card_image_container.dart';

class FoodCard extends StatelessWidget {
  static const double _defaultHeight = 87;

  final String image;
  final String title;
  final String subtitle;
  final double price;

  const FoodCard({
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
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardImageContainer(image: image),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            height: 1
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5,),
                      Text(subtitle,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(secondaryBlackColor).withOpacity(0.3),
                            height: 1
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Text('\$$price',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(accentValueColor),
                height: 1
            ),
          )



        ],
      ),
    );
  }
}
