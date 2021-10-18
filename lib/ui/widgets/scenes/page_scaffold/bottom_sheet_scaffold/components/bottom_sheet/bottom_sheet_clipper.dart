import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

class BottomSheetClipper extends CustomClipper<ui.Path> {
  @override
  ui.Path getClip(ui.Size size) {
    final Path path_0 = ui.Path();


    path_0.moveTo(0, 46.5691);
    path_0.cubicTo(0,23.9969,17.4479,5.30697,39.9898,4.13571);
    path_0.cubicTo(size.width*0.2020293, 2.27706,size.width*0.3498133,0,size.width*0.5013333,0);
    path_0.cubicTo(size.width*0.6523920,0,size.width*0.7988107, 2.26325,size.width*0.8934667, 4.11876);
    path_0.cubicTo(size.width*0.9535440, 5.29642,size.width, 23.9787,size.width, 46.5381);

    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(0,size.height);

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<ui.Path> oldClipper) {
    return false;
  }
  
}