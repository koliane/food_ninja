import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/widgets/base/button/float_image_button.dart';
import 'package:food_ninja/ui/widgets/base/button/secondary_button.dart';
import 'package:food_ninja/ui/widgets/base/input/base_text_input.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/decorated_page_scaffold.dart';

class PrimaryContentScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Function? init;
  final bool? resizeToAvoidBottomInset;
  final bool showBottomAppBar;
  final List<Widget>? positionedChildren;

  const PrimaryContentScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.init,
    this.resizeToAvoidBottomInset,
    this.showBottomAppBar = false,
    this.positionedChildren,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double doubleTopPadding = MediaQuery.of(context).padding.top;

    return DecoratedPageScaffold(
      showBottomAppBar: showBottomAppBar,
      init: init,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      positionedChildren: positionedChildren,

      body: Column(
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
          body,

          const SizedBox(height: 40,)
        ],
      ),
    );
  }
}