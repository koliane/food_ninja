import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/components/order_position_card/order_position_card.dart';
import 'package:food_ninja/ui/widgets/pages/order_detail_page/components/order_bar.dart';
import 'package:food_ninja/ui/widgets/scenes/app_bar/top_app_bar.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/decorated_page_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/section/vertical_list_section.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedPageScaffold(      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopAppBar(),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 250, left: 14, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Order details', style: Theme.of(context).textTheme.headline1),
                ),
                SizedBox(height: 20,),
                VerticalListSection(
                  listPadding: EdgeInsets.zero,
                  children: [
                    OrderPositionCard(
                        image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/spacy_fresh_crab.jpg',
                        title: 'Spacy fresh crab',
                        subtitle: 'Waroenk kita',
                        price: 35
                    ),
                    OrderPositionCard(
                        image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/spacy_fresh_crab2.png',
                        title: 'Spacy fresh crab',
                        subtitle: 'Waroenk kita',
                        price: 35
                    ),
                    OrderPositionCard(
                        image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/spacy_fresh_crab3.png',
                        title: 'Spacy fresh crab',
                        subtitle: 'Waroenk kita',
                        price: 35
                    ),
                    OrderPositionCard(
                        image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/spacy_fresh_crab3.png',
                        title: 'Spacy fresh crab',
                        subtitle: 'Waroenk kita',
                        price: 35
                    ),
                    OrderPositionCard(
                        image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/spacy_fresh_crab3.png',
                        title: 'Spacy fresh crab',
                        subtitle: 'Waroenk kita',
                        price: 35
                    ),
                    OrderPositionCard(
                        image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/spacy_fresh_crab3.png',
                        title: 'Spacy fresh crab',
                        subtitle: 'Waroenk kita',
                        price: 35
                    ),
                    OrderPositionCard(
                        image: 'https://icrab.pro/themes/icrab/assets/images/food_ninja/food/spacy_fresh_crab3.png',
                        title: 'Spacy fresh crab',
                        subtitle: 'Waroenk kita',
                        price: 35
                    )
                  ]
                )

              ],
            ),
          )
        ],
      ),

      positionedChildren: [
        Positioned(
          bottom: 0,
          child: OrderBar()
        )
      ],
    );
  }
}
