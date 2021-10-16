import 'package:flutter/material.dart';

const backgroundPatternGradient = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.9, 1],
      colors: [
        Color(0x00FFFFFF),
        Color(0xF8FFFFFF),
      ]
  ),
);