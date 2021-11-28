import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class WBSPage extends StatefulWidget {
  const WBSPage({Key? key}) : super(key: key);

  @override
  _WBSPageState createState() => _WBSPageState();
}

class _WBSPageState extends State<WBSPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserWallet;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 4, 0),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
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
                        child: Image.asset(
                            'assets/icons/infinity_wallet_icon.png')),
                  ),
                  const Spacer(flex: 4),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    height: screenSize.width * 0.3,
                    width: screenSize.width * 0.3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [kFontBlue, kGradientBlue],
                          stops: [0.3, 1.0]),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FittedBox(
                        child: Icon(Icons.backup),
                      ),
                    )),
              ),
              const InitialMainText(title: 'Backup Seed'),
              const InitialSubtitleText(
                  subtitle:
                      'Shows your wallet\'s\n12 or 24 word backup phrase'),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                      child: Container(
                          height: screenSize.height * 0.07,
                          width: screenSize.width * 0.5,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [kFontBlue, kGradientBlue],
                                  stops: [0.3, 1.0]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const FittedBox(
                            child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Text('View Backup Seed')),
                          )),
                      onTap: () => args.pin == null
                          ? Navigator.of(context)
                              .pushNamed(AppRoutes.VBSPAGE, arguments: args)
                          : Navigator.of(context)
                              .pushNamed(AppRoutes.PINLOGINPAGE, arguments: args))),
              const Divider(
                thickness: 0.2,
                color: kFontBlue,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    height: screenSize.width * 0.3,
                    width: screenSize.width * 0.3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [kFontBlue, kGradientBlue],
                          stops: [0.3, 1.0]),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FittedBox(child: Icon(Icons.vpn_key)),
                    )),
              ),
              const InitialMainText(title: 'Private Keys'),
              const InitialSubtitleText(
                  subtitle:
                      'Shows your private keys\npublic and extended addresses'),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    child: Container(
                        height: screenSize.height * 0.07,
                        width: screenSize.width * 0.5,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [kFontBlue, kGradientBlue],
                                stops: [0.3, 1.0]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const FittedBox(
                          child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text('View Private Keys')),
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
