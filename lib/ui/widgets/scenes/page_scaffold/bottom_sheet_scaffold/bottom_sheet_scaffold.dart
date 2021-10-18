import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/bottom_sheet_scaffold/components/bottom_sheet/custom_bottom_cheet.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class BottomSheetScaffold extends StatelessWidget {
  final String image;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Function? init;
  final bool? resizeToAvoidBottomInset;
  final bool showBottomAppBar;
  final List<Widget>? positionedChildren;
  final Widget? bottomNavigationBar;

  const BottomSheetScaffold({
    required this.image,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.init,
    this.resizeToAvoidBottomInset,
    this.showBottomAppBar = false,
    this.positionedChildren,
    this.bottomNavigationBar,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageScaffold(
      showBottomAppBar: showBottomAppBar,
      init: init,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 415,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover
                )
            ),
          ),
          SingleChildScrollView(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              child: CustomBottomSheet(child: body)
          ),
        ],
      )
    );
  }

}