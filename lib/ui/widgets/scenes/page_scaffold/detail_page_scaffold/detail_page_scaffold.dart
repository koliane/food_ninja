import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/base/label/text_chips_label.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/bottom_sheet_scaffold/bottom_sheet_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/section/vertical_list_section.dart';

class DetailPageScaffold extends StatelessWidget {
  final Widget? body;
  final String image;
  final String title;
  final String description;
  final List<Widget> serviceItems;
  final List<Widget> reviews;

  const DetailPageScaffold({
    this.body,
    required this.image,
    required this.title,
    required this.description,
    required this.serviceItems,
    required this.reviews,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
        image: image,
        bottomNavigationBar: const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 20, right: 25),
            child: PrimaryButton('Add To Cart')
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextChipsLabel(
                  text: 'Popular',
                  textWidth: 45,
                  textHeight: 16,
                ),
                Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(primaryLabelColor)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                      child: SvgPicture.asset('assets/images/icons/map_pin.svg'),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      width: 34,
                      height: 34,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(secondaryLabelColor)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                      child: SvgPicture.asset('assets/images/icons/heart.svg'),
                    ),
                  ],
                ),

              ],
            ),
            const SizedBox(height: 20,),

            Text(title, style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 27, height: 1),),
            const SizedBox(height: 20,),

            Row(
              children: buildServiceItemsList()
            ),
            const SizedBox(height: 20,),

            Text(description),
            const SizedBox(height: 20,),

            body ?? const SizedBox.shrink(),

            VerticalListSection(
                title: 'Testimonials',
                moreLink: '',
                padding: EdgeInsets.zero,
                listPadding: EdgeInsets.zero,
                children: reviews
            ),
          ],
        )
    );
  }

  List<Widget> buildServiceItemsList() {
    final List<Widget> result = [];
    final int lastIndex = serviceItems.length - 1;

    for(int i = 0; i < lastIndex; i++) {
      final Widget item = serviceItems[i];
      result.addAll([
        item,
        const SizedBox(width: 20,)
      ]);
    }

    if(lastIndex >= 0) {
      result.add(serviceItems.last);
    }

    return result;
  }
}