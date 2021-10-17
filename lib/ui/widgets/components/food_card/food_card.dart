import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              const SizedBox(width: 20,),
              Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(subtitle,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(secondaryBlackColor).withOpacity(0.3),
                        height: 1
                    ),
                  ),
                ],
              )
            ],
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
