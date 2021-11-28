import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';

class InitialSubtitleText extends StatelessWidget {
  final String subtitle;
  const InitialSubtitleText({Key? key,required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, color: kCoolGrey),
        textAlign: TextAlign.center,
      ),
    );
  }
}
