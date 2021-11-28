import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class ChooseMnemonicPage extends StatefulWidget {
  const ChooseMnemonicPage({Key? key}) : super(key: key);

  @override
  _ChooseMnemonicPageState createState() => _ChooseMnemonicPageState();
}

class _ChooseMnemonicPageState extends State<ChooseMnemonicPage> {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Container(
                            height: screenSize.height * 0.35,
                            width: screenSize.width * 0.7,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: kBarsColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(32),
                                    child: Container(
                                        height: screenSize.width * 0.15,
                                        width: screenSize.width * 0.15,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [
                                            kFontBlue,
                                            kGradientBlue
                                          ], stops: [
                                            0,
                                            1
                                          ]),
                                        ),
                                        child: const FittedBox(
                                          child: Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Text('12')),
                                        ))),
                                Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: SizedBox(
                                      height: screenSize.height * 0.15,
                                      width: screenSize.width * 0.65,
                                      child: Column(
                                        children: const [
                                          InitialMainText(
                                              title: '12 Word Seed'),
                                          InitialSubtitleText(
                                              subtitle:
                                                  'Restore your wallet from 12 word\nseed phrase'),
                                        ],
                                      ),
                                    ))
                              ],
                            )),
                        onTap: () {
                          UserWallet newWallet = args;
                          newWallet.tokenType = false;
                          Navigator.of(context).pushNamed(AppRoutes.IMPORTMNEMONICPAGE,
                              arguments: newWallet);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Container(
                            height: screenSize.height * 0.35,
                            width: screenSize.width * 0.7,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: kBarsColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(32),
                                    child: Container(
                                        height: screenSize.width * 0.15,
                                        width: screenSize.width * 0.15,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [
                                            kFontBlue,
                                            kGradientBlue
                                          ], stops: [
                                            0,
                                            1
                                          ]),
                                        ),
                                        child: const FittedBox(
                                          child: Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Text('24')),
                                        ))),
                                Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: SizedBox(
                                      height: screenSize.height * 0.15,
                                      width: screenSize.width * 0.65,
                                      child: Column(
                                        children: const [
                                          InitialMainText(
                                              title: '24 Word Seed'),
                                          InitialSubtitleText(
                                              subtitle:
                                                  'Restore your wallet from 24 word\nseed phrase'),
                                        ],
                                      ),
                                    ))
                              ],
                            )),
                        onTap: () {
                          UserWallet newWallet = args;
                          newWallet.tokenType = true;
                          Navigator.of(context).pushNamed(AppRoutes.IMPORTMNEMONICPAGE,
                              arguments: newWallet);
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
