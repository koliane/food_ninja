import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//TODO используется только на странице регистрации. Макета для отжатой кнопки нет
class RadioButton extends StatelessWidget {
  final String text;
  const RadioButton({
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        SvgPicture.asset('assets/images/input/selected_radio.svg', width: 22,),
        const SizedBox(width: 8,),
        Text(text,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: const Color(0x80000000),
          )
        )
      ],
    );
  }
}
