import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/components/restaurant_card/restaurant_card.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/primary_content_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/section/section.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryContentScaffold(
        showBottomAppBar: true,
        body: Section(
          title: 'Popular Restaurant',
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
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
                  image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/restaurants/good_food.png',
                  title: 'Good Food',
                  subtitle: '12 Mins'
              ),
            ],
          ),
        )
    );
  }
}
