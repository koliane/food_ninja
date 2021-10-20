import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class OnboardingPageScaffold extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback action;

  const OnboardingPageScaffold({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fitWidth
                    )
                  ),
                  alignment: Alignment.topCenter,
                )
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 65),
              child: Column(
                children: [
                  Text(title, style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),

                  Text(description, textAlign: TextAlign.center,),
                  const SizedBox(height: 45,),

                  PrimaryButton('Next', onPressed: action,),
                  const SizedBox(height: 60,)
                ]
              ),
            )
          ],
        )
    );
  }
}