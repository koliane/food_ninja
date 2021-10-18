import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';
import 'package:food_ninja/ui/styles/default/text_style.dart';
import 'package:food_ninja/ui/widgets/base/label/chips_label.dart';
import 'package:food_ninja/ui/widgets/components/image_container/card_image_container.dart';

class ReviewCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String description;

  const ReviewCard({
    required this.image,
    required this.title,
    required this.date,
    required this.description,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.fromLTRB(11, 10, 24, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: primaryShadow,
        color: Colors.white
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardImageContainer(image: image),
          const SizedBox(width: 20,),
          Expanded(
            child: Stack(
              children: [
                Column(
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
                    Text(date,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(secondaryBlackColor).withOpacity(0.3),
                          height: 1
                      ),
                    ),
                    const SizedBox(height: 15,),

                    Text(description),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: ChipsLabel(
                    height: 33,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/images/icons/star.svg'),
                        const SizedBox(width: 5,),
                        Text('5',
                          style: getAccentTextStyle(context, 10, 29)?.copyWith(
                            height: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
