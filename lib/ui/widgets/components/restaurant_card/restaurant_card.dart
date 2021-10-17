import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';

class RestaurantCard extends StatelessWidget {
  static const double _defaultHeight = 184;

  final String image;
  final String title;
  final String subtitle;

  const RestaurantCard({
    required this.image,
    required this.title,
    required this.subtitle,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _defaultHeight,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: primaryShadow,
      ),
      child: Column(
        children: [
          Expanded(
              child: Center(
                  child: Image.network(image)
              ),
          ),

          Text(title,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(subtitle,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 13,
              color: const Color(0x80000000)
            ),
          ),

        ],
      ),
    );
  }
}
