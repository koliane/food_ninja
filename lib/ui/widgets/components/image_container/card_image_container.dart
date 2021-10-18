import 'package:flutter/material.dart';

class CardImageContainer extends StatelessWidget {
  final String image;

  const CardImageContainer({
    required this.image,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
