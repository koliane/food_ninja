import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/widgets/base/button/float_image_button.dart';
import 'package:food_ninja/ui/widgets/base/button/secondary_button.dart';
import 'package:food_ninja/ui/widgets/base/input/base_text_input.dart';
import 'package:food_ninja/ui/widgets/components/food_card/food_card.dart';
import 'package:food_ninja/ui/widgets/components/restaurant_card/restaurant_card.dart';
import 'package:food_ninja/ui/widgets/scenes/section/single_line_list_section.dart';
import 'package:food_ninja/ui/widgets/scenes/section/vertical_list_section.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double doubleTopPadding = MediaQuery.of(context).padding.top;

    return PageScaffold(
        showBottomAppBar: true,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Positioned(
                  top: -580,
                  right: -250,
                  child: Transform.rotate(
                    angle: 20 * math.pi / 180,
                    child: Image.asset(
                      'assets/images/background/background_pattern.png',
                      width: 500,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                        height: doubleTopPadding == 0
                            ? 60
                            : doubleTopPadding + 40
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 39),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Find Your\nFavorite Food',
                              style: Theme.of(context).textTheme.headline1?.copyWith(
                                  fontSize: 31,
                                  height: 1
                              )
                          ),
                          const FloatImageButton(
                              image: 'assets/images/icons/notification.png'
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: BaseTextInput(
                              height: 50,
                              prefixImage: 'assets/images/icons/search.svg',
                              placeholder: 'What do you want to order?',
                              placeholderTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                                color: const Color(placeholderColor3),
                              ),
                              prefixOffset: const Offset(18, 13),
                              fillColor: const Color(secondaryComponentBackgroundColor),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SecondaryButton(
                              child: SvgPicture.asset('assets/images/icons/filter.svg')
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Image.network('https://icrab.pro/themes/icrab/assets/images/food_ninja/banner.png',),
                    ),
                    const SizedBox(height: 25,),

                    SizedBox(
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
                    SizedBox(height: 20,),
                    VerticalListSection(
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


                    const SizedBox(height: 40,)
                  ],
                ),
              ],
            ),

          ],
        )
    );
  }
}
