import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/components/food_card/food_card.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/primary_content_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/section/vertical_list_section.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryContentScaffold(
        showBottomAppBar: true,
        body: const VerticalListSection(
            title: 'Popular Menu',
            children: [
              FoodCard(
                  image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/green_noodle.jpg',
                  title: 'Green Noodle',
                  subtitle: 'Noodle Home',
                  price: 15
              ),
              FoodCard(
                  image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/green_noodle.jpg',
                  title: 'Green Noodle',
                  subtitle: 'Noodle Home',
                  price: 15
              ),
              FoodCard(
                  image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/green_noodle.jpg',
                  title: 'Green Noodle',
                  subtitle: 'Noodle Home',
                  price: 15
              )
            ]
        ),
    );
  }
}
