import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/components/review_card/review_card.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/detail_page_scaffold/components/service_item/service_item.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/detail_page_scaffold/detail_page_scaffold.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
        title: 'Rainbow Sandwich Sugarless',
        image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/detail/cake.jpg',
        serviceItems: [
          ServiceItem(
              image: 'assets/images/icons/star_half.png',
              text: '4,8 Rating'
          ),
          ServiceItem(
              image: 'assets/images/icons/bag.png',
              text: '2000+ Order'
          ),
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
        description: '''Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.

        Strowberry
        Cream
        wheat

        Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.''',

    );
  }
}