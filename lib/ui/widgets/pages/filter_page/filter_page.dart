import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/base/tag.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/primary_content_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/section/section.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double primaryButtonWidth = MediaQuery.of(context).size.width - 50;

    return PrimaryContentScaffold(
      positionedChildren: [
        Positioned(
          bottom: 31,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: PrimaryButton('Search', width: primaryButtonWidth,),
          ),
        )
      ],
      body: Column(
        children: [
          Section(
            title: 'Type',
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Tag('Restaurant'),
                  Tag('Menu'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),

          Section(
            title: 'Location',
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Tag('1 Km'),
                  Tag('>10 Km'),
                  Tag('<10 Km'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),

          Section(
            title: 'Food',
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Tag('Cake'),
                  Tag('Soup'),
                  Tag('Main Course'),
                  Tag('Appetizer'),
                  Tag('Dessert'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
