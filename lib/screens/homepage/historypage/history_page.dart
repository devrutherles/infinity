import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: SizedBox.expand(
            child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                height: screenSize.height * 0.07,
                width: screenSize.width * 0.15,
                child: Image.asset('assets/infinity_official_logo.png'))),
        const Spacer(),
        Container(
            height: screenSize.width * 0.4,
            width: screenSize.width * 0.4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [kFontBlue, kGradientBlue], stops: [0.3, 1.0]),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: FittedBox(
                child: Icon(Icons.smartphone),
              ),
            )),
        const InitialMainText(title: 'There are no transactions!'),
        const InitialSubtitleText(
            subtitle:
                'Start using your wallet and transactions will appear here.'),
        const Spacer(),
      ],
    )));
  }
}
