import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_picture.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({Key? key}) : super(key: key);

  @override
  _BackupPageState createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  int _index = 0;
  String mnemonic = '';
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
          const InitialPicture(picture: 'assets/icons/wallet_icon.png'),
          const InitialMainText(title: 'Backup your wallet'),
          args.tokenType == false
              ? const InitialSubtitleText(
                  subtitle:
                      'In the next step you will see 12 recovery words.\nThis is the only way to recover your wallet if you lose it!')
              : const InitialSubtitleText(
                  subtitle:
                      'In the next step you will see 24 recovery words.\nThis is the only way to recover your wallet if you lose it!'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 0.2,
              color: kCoolGrey,
              indent: 15,
              endIndent: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
                child: SizedBox(
                  height: screenSize.height * 0.1,
                  width: screenSize.width * 0.8,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: _index == 1
                              ? Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kFontBlue,
                                      border: Border.all(color: kFrenchGrey)))
                              : Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: kFrenchGrey)))),
                      const FittedBox(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'I understand that if i lose my recovery words i\nwill not be able to access my wallet',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  _index == 0
                      ? setState(() {
                          _index = 1;
                        })
                      : setState(() {
                          _index = 0;
                        });
                }),
          ),
          _index == 0
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.8,
                      decoration: const BoxDecoration(
                        color: kCoolGrey,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: args.tokenType == false
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: FittedBox(
                                  child: Text('Generate 12 word seed')),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: FittedBox(
                                  child: Text('Generate 24 word seed')),
                            ),
                    ),
                    onTap: () => showToast(context, 'Confirm the terms'),
                  ))
              : Padding(
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
                      child: args.tokenType == false
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: FittedBox(
                                  child: Text('Generate 12 word seed')),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: FittedBox(
                                  child: Text('Generate 24 word seed')),
                            ),
                    ),
                    onTap: () {
                      args.tokenType == false
                          ? mnemonic = 'Popular Bar Ball Rice Wet Paddle Mad Next Purity Cup Play Awesome'
                          : mnemonic = 'History Lawyer Lake Superficial Participate Amusing Maddening Philosophy Measly Ghost Chaos Talented Stupendous Surreal Rough Cute Hazy Pest Companion Distance Licker Tray Contend Wiry';
                      UserWallet newWallet = args;
                      newWallet.token = mnemonic;

                      Navigator.of(context).pushNamed(AppRoutes.SAVEBACKUPPAGE, arguments: newWallet);
                    },
                  ))
        ],
      ),
    )));
  }
}
