import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/snack_bar.dart';

class SwapPage extends StatefulWidget {
  const SwapPage({Key? key}) : super(key: key);

  @override
  _SwapPageState createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
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
        Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
              child: Container(
                  height: screenSize.height * 0.09,
                  width: screenSize.width * 0.85,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/coins/bitcoin_logo.png'),
                    ),
                    title: const Text('Bitcoin'),
                    subtitle: Row(
                      children: const [
                        Text('0.00 BTC |',
                            style: TextStyle(color: Colors.amber)),
                        Text('0.00 USD'),
                      ],
                    ),
                    trailing: const Icon(Icons.expand_more),
                  )),
              onTap: () {
              }),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('0.00', style: TextStyle(color: Colors.amber)),
                Text('BTC', style: TextStyle(color: Colors.amber)),
              ],
            )),
        const Divider(
            thickness: 0.5, color: Colors.amber, indent: 15, endIndent: 15),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('0.00'),
                Text('USD'),
              ],
            )),
        Row(
          children: [
            const Expanded(
              child: Divider(
                  thickness: 0.5, color: kFontBlue, indent: 15, endIndent: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Container(
                  height: screenSize.width * 0.15,
                  width: screenSize.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [kFontBlue, kGradientBlue], stops: [0.3, 1.0]),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FittedBox(
                      child: Icon(Icons.swap_vert),
                    ),
                  )),
            ),
            const Expanded(
              child: Divider(
                  thickness: 0.5, color: kFontBlue, indent: 15, endIndent: 15),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              child: Container(
                  height: screenSize.height * 0.09,
                  width: screenSize.width * 0.85,
                  decoration: BoxDecoration(
                      border: Border.all(color: kWhitePC),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/coins/ethereum_logo.png'),
                    ),
                    title: const Text('Ethereum'),
                    subtitle: Row(
                      children: const [
                        Text('0.00 BTC |',
                            style: TextStyle(color: kFrenchGrey)),
                        Text('0.00 USD'),
                      ],
                    ),
                    trailing: const Icon(Icons.expand_more),
                  )),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('0.00', style: TextStyle(color: kFrenchGrey)),
                Text('ETH', style: TextStyle(color: kFrenchGrey)),
              ],
            )),
        const Divider(
            thickness: 0.5, color: Colors.amber, indent: 15, endIndent: 15),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('0.00'),
                Text('USD'),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            child: Container(
                height: screenSize.height * 0.07,
                width: screenSize.width * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const FittedBox(
                    child: Padding(
                        padding: EdgeInsets.all(12), child: Text('EXCHANGE')))),
            onTap: () {
              showToast(context, 'Unavailable function.');
            },
          ),
        ),
        const InitialSubtitleText(
            subtitle: 'Average processing time 5-30 minutes.')
      ],
    )));
  }
}
