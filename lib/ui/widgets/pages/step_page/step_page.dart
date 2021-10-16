import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/components/app_bar/top_app_bar.dart';

class StepPage extends StatelessWidget {
  final String title;
  final String buttonText;
  final String description;
  final Widget child;

  const StepPage({
    required this.title,
    required this.buttonText,
    required this.description,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
            top: 0,
            left: 0,
            child: TopAppBar()
        ),
        Container(
          // color: Colors.green,
          padding: const EdgeInsets.only(
            top: 83,
            bottom: 117,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.headline1),
                    const SizedBox(height: 20,),
                    Text(description, style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ),

              child
            ],
          ),
        ),
        Positioned(
            bottom: 60,
            child: PrimaryButton(buttonText)
        )
      ],
    );
  }
}
