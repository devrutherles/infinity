import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        backgroundColor: kFontBlue,
        duration: const Duration(seconds: 1),
      ),
    );
  }