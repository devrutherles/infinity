import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/routes/routes.dart';

class RedirectPage extends StatefulWidget {
  const RedirectPage({Key? key}) : super(key: key);

  @override
  _RedirectPageState createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as bool;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SizedBox.expand(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
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
                      child:
                          Image.asset('assets/icons/infinity_wallet_icon.png')),
                ),
                const Spacer(flex: 4),
              ]),
            ),
            Container(
                height: screenSize.width * 0.6,
                width: screenSize.width * 0.6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [kFontBlue, kGradientBlue], stops: [0.3, 1.0]),
                ),
                child: const FittedBox(
                    child: Padding(
                        padding: EdgeInsets.all(8), child: Icon(Icons.check)))),
            args == true
                ? const InitialMainText(title: 'Wallet created!')
                : const InitialMainText(title: 'Wallet restored!'),
            args == true
                ? const InitialSubtitleText(
                    subtitle:
                        'Your wallet has been succesfully created.\nThank you for using InifinityWallet!')
                : const InitialSubtitleText(
                    subtitle:
                        'Your wallet has been succesfully restored.\nThank you for using InifinityWallet!'),
            Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.8,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [kFontBlue, kGradientBlue],
                            stops: [0.3, 1.0]),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: FittedBox(child: Text('Continue to wallet')),
                      )),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.HOMEPAGE);
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
