import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_ninja/core/domain/entities/dish/model/dish.dart';
import 'package:food_ninja/core/domain/entities/restaurant/model/restaurant.dart';
import 'package:food_ninja/state/management/mobx/modules/main_page/main_page_state.dart';
import 'package:food_ninja/state/management/state_facade.dart';
import 'package:food_ninja/ui/widgets/components/food_card/food_card.dart';
import 'package:food_ninja/ui/widgets/components/restaurant_card/restaurant_card.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/primary_content_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/section/single_line_list_section.dart';
import 'package:food_ninja/ui/widgets/scenes/section/vertical_list_section.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainPageState state = StateFacade().mainPage;

    return PrimaryContentScaffold(
      init: () {
        StateFacade().mainPage.init();
      },
        showBottomAppBar: true,
        body: Column(
          children: [
            Observer(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: state.bannerUrl.isNotEmpty ? Image.network(state.bannerUrl,) : null,
                );
              }
            ),
            const SizedBox(height: 25,),
            SizedBox(
              height: 224,
              child: Observer(
                builder: (_) {
                  final restaurants = state.nearestRestaurants.toList();

                  return SingleLineListSection(
                    title: 'Nearest Restaurant',
                    moreLink: '',
                    children: [
                      for(Restaurant restaurant in restaurants)
                        RestaurantCard(
                            image: restaurant.previewImage ?? '',
                            title: restaurant.name,
                            subtitle: restaurant.deliveryTime != null
                                ? '${restaurant.deliveryTime!.inMinutes} Mins'
                                : ''
                        ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20,),

            Observer(
              builder: (_){
                final  dishes = state.popularDishes.toList();

                return VerticalListSection(
                    title: 'Popular Menu',
                    moreLink: '',
                    children: [
                      for(Dish dish in dishes)
                        FoodCard(
                          image: dish.previewImage ?? '',
                          title: dish.name ?? '',
                          subtitle: dish.restaurant == null ? '' : dish.restaurant!.name,
                          price: dish.price ?? 0
                        ),
                    ]
                );
              },
            ),

          ],
        ),
    );
  }
}