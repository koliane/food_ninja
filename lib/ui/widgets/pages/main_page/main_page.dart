import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/components/food_card/food_card.dart';
import 'package:food_ninja/ui/widgets/components/restaurant_card/restaurant_card.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/primary_content_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/section/single_line_list_section.dart';
import 'package:food_ninja/ui/widgets/scenes/section/vertical_list_section.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryContentScaffold(
        showBottomAppBar: true,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.network('https://icrab.pro/themes/icrab/assets/images/food_ninja/banner.png',),
            ),
            const SizedBox(height: 25,),
            const SizedBox(
              height: 224,
              child: SingleLineListSection(
                title: 'Nearest Restaurant',
                moreLink: '',
                children: [
                  RestaurantCard(
                      image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/restaurants/vegan_resto.png',
                      title: 'Vegan Resto',
                      subtitle: '12 Mins'
                  ),
                  RestaurantCard(
                      image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/restaurants/healthy_food.png',
                      title: 'Healthy Food',
                      subtitle: '8 Mins'
                  ),
                  RestaurantCard(
                      image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/restaurants/healthy_food.png',
                      title: 'Healthy Food',
                      subtitle: '8 Mins'
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const VerticalListSection(
                title: 'Popular Menu',
                moreLink: '',
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
                  )
                ]
            ),

          ],
        ),
    );
  }
}