import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';

class WordCapsule extends StatelessWidget {
  final String text;
  final String index;
  const WordCapsule({Key? key, required this.text, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
                height: screenSize.width * 0.07,
                width: screenSize.width * 0.07,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [kFontBlue, kGradientBlue], stops: [0.3, 1.0]),
                ),
                child: FittedBox(
                    child: Padding(
                        padding: const EdgeInsets.all(8), child: Text(index)))),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
                height: screenSize.height * 0.05,
                width: screenSize.width * 0.15,
                decoration: BoxDecoration(
                  border: Border.all(color: kFontBlue),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(text),
                  ),
                )),
          ),
        ]));
  }
}
