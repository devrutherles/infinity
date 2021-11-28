import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/word_capsule.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class SaveBackupPage extends StatefulWidget {
  const SaveBackupPage({Key? key}) : super(key: key);

  @override
  _SaveBackupPageState createState() => _SaveBackupPageState();
}

class _SaveBackupPageState extends State<SaveBackupPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserWallet;
    List<String> mnemonic = args.token!.split(' ');
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
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
                  child: Image.asset('assets/icons/infinity_wallet_icon.png')),
            ),
            const Spacer(flex: 4),
          ]),
        ),
        const InitialMainText(title: 'Save your backup phrase'),
        args.tokenType == false
            ? const InitialSubtitleText(
                subtitle:
                    'Write down those 12 words in order.\nRemember - keep them somewhere safe!')
            : const InitialSubtitleText(
                subtitle:
                    'Write down those 24 words in order.\nRemember - keep them somewhere safe!'),
        args.tokenType == false
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[0], index: '1'),
                          WordCapsule(text: mnemonic[1], index: '2'),
                          WordCapsule(text: mnemonic[2], index: '3'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[3], index: '4'),
                          WordCapsule(text: mnemonic[4], index: '5'),
                          WordCapsule(text: mnemonic[5], index: '6'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[6], index: '7'),
                          WordCapsule(text: mnemonic[7], index: '8'),
                          WordCapsule(text: mnemonic[8], index: '9'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[9], index: '10'),
                          WordCapsule(text: mnemonic[10], index: '11'),
                          WordCapsule(text: mnemonic[11], index: '12'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[0], index: '1'),
                          WordCapsule(text: mnemonic[1], index: '2'),
                          WordCapsule(text: mnemonic[2], index: '3'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[3], index: '4'),
                          WordCapsule(text: mnemonic[4], index: '5'),
                          WordCapsule(text: mnemonic[5], index: '6'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[6], index: '7'),
                          WordCapsule(text: mnemonic[7], index: '8'),
                          WordCapsule(text: mnemonic[8], index: '9'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[9], index: '10'),
                          WordCapsule(text: mnemonic[10], index: '11'),
                          WordCapsule(text: mnemonic[11], index: '12'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[12], index: '13'),
                          WordCapsule(text: mnemonic[13], index: '14'),
                          WordCapsule(text: mnemonic[14], index: '15'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[15], index: '16'),
                          WordCapsule(text: mnemonic[16], index: '17'),
                          WordCapsule(text: mnemonic[17], index: '18'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[18], index: '19'),
                          WordCapsule(text: mnemonic[19], index: '20'),
                          WordCapsule(text: mnemonic[20], index: '21'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WordCapsule(text: mnemonic[21], index: '22'),
                          WordCapsule(text: mnemonic[22], index: '23'),
                          WordCapsule(text: mnemonic[23], index: '24'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              child: Container(
                  height: screenSize.height * 0.07,
                  width: screenSize.width * 0.8,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kFontBlue, kGradientBlue], stops: [0.3, 1.0]),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FittedBox(child: Text('Continue')),
                  )),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.CONFIRMWALLET, arguments: args);
              },
            ))
      ],
    )));
  }
}
