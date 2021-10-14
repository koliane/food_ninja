import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton(
    this.text,
    {
      Key? key,
      required this.onPressed
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 157,
        height: 57,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF53E88B),
              Color(0xFF15BE77)
            ]
          ),
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Text(text, style: Theme.of(context).primaryTextTheme.bodyText2),
      ),
    );
  }
}
