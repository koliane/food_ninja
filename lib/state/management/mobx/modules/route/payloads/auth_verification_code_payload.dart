import 'package:flutter/material.dart';

class AuthVerificationCodePayload {
  final String email;
  final VoidCallback action;
  final ValueChanged<String> onChanged;

  AuthVerificationCodePayload({
    required this.email,
    required this.action,
    required this.onChanged
  });
}