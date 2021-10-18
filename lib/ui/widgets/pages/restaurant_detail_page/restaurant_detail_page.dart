import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/components/restaurant_card/restaurant_card.dart';
import 'package:food_ninja/ui/widgets/components/review_card/review_card.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/detail_page_scaffold/components/service_item/service_item.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/detail_page_scaffold/detail_page_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/section/single_line_list_section.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      title: 'Wijie Bar and Resto',
      image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/restaurants/detail/restaurant_detail.png',
      serviceItems: [
        ServiceItem(
            image: 'assets/images/icons/map_pin_light.png',
            text: '19 Km'
        ),
        ServiceItem(
            image: 'assets/images/icons/star_half.png',
            text: '4,8 Rating'
        )
      ],
      reviews: [
        ReviewCard(
          image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/avatars/Dianne_Russell.png',
          title: 'Dianne Russell',
          date: '12 April 2021',
          description: 'This Is great, So delicious! You Must Here, With Your family . . ',
        ),
        ReviewCard(
          image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/avatars/Dianne_Russell2.png',
          title: 'Dianne Russell',
          date: '12 April 2021',
          description: 'This Is great, So delicious! You Must Here, With Your family . . ',
        ),
      ],
      description: 'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
      body: Column(
        children: [
          SizedBox(
            height: 224,
            child: SingleLineListSection(
              title: 'Popular Menu',
              moreLink: '',
              padding: EdgeInsets.zero,
              listPadding: EdgeInsets.zero,
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
        ],
      )
    );
  }
}