import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/bottom_sheet_scaffold/components/bottom_sheet/bottom_sheet_clipper.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;

  const CustomBottomSheet({
    required this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: const EdgeInsets.only(top: 285),
      child: ClipPath(
        clipper: BottomSheetClipper(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 155),
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 18, 30, 45),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),

            // child: child
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset('assets/images/icons/scroll_knob.svg'),
                const SizedBox(height: 20),
                child
              ],
            )
          ),
        )
      )
    );
  }
}
