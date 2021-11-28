import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/model/coin.dart';
import 'package:infinitywallet/routes/routes.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({Key? key}) : super(key: key);

  @override
  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Coin;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SizedBox.expand(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(1.0),
                child: Text('Back'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                    height: screenSize.width * 0.1,
                    width: screenSize.width * 0.3,
                    child:
                        Image.asset('assets/icons/infinity_wallet_icon.png')),
              ),
              const Spacer(flex: 4),
            ]),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                  height: screenSize.height * 0.2,
                  width: screenSize.height * 0.2,
                  child: FittedBox(
                    child: CircleAvatar(
                      backgroundColor: kBarsColor,
                      backgroundImage: AssetImage(args.icon!),
                    ),
                  ))),
          InitialMainText(title: '${args.name} (${args.initials})'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kCoolGrey),
                              shape: BoxShape.circle),
                          child: FittedBox(
                              child: IconButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(AppRoutes.SENDPAGE,
                                          arguments: args),
                                  icon: const Icon(Icons.north_east)))),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text('Send')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kCoolGrey),
                              shape: BoxShape.circle),
                          child: FittedBox(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.swap_horiz)))),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text('Swap')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kCoolGrey),
                              shape: BoxShape.circle),
                          child: FittedBox(
                              child: IconButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(AppRoutes.RECEIVEPAGE,
                                          arguments: args),
                                  icon: const Icon(Icons.south_east)))),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text('Receive')),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 0.5,
              color: kCoolGrey,
              indent: 15,
              endIndent: 15,
            ),
          ),
          Container(
              height: screenSize.width * 0.3,
              width: screenSize.width * 0.3,
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
        ],
      )),
    ));
  }
}
