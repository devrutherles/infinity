import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';

class InitialPicture extends StatelessWidget {
  final String picture;
  const InitialPicture({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
            height: screenSize.width * 0.5,
            width: screenSize.width * 0.5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [kFontBlue, kGradientBlue], stops: [0.3, 1.0]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FittedBox(
                child: Image.asset(picture),
              ),
            )));
  }
}
