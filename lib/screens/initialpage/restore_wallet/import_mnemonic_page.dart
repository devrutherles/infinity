import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/shared_preferences.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class ImportMnemonicPage extends StatefulWidget {
  const ImportMnemonicPage({Key? key}) : super(key: key);

  @override
  _ImportMnemonicPageState createState() => _ImportMnemonicPageState();
}

class _ImportMnemonicPageState extends State<ImportMnemonicPage> {
  String? _mnemonic;
  late TextEditingController _mnemonicController;

  @override
  void initState() {
    super.initState();
    _mnemonicController = TextEditingController();
  }

  @override
  void dispose() {
    _mnemonicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = SharedPref();
    final args = ModalRoute.of(context)!.settings.arguments as UserWallet;
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
                    child:
                        Image.asset('assets/icons/infinity_wallet_icon.png')),
              ),
              const Spacer(flex: 4),
            ]),
          ),
          const InitialMainText(title: 'Enter your backup phrase'),
          args.tokenType == false
              ? const InitialSubtitleText(
                  subtitle: 'Please re-enter your 12 word backup phrase')
              : const InitialSubtitleText(
                  subtitle: 'Please re-enter your 24 word backup phrase'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: screenSize.height * 0.07,
              width: screenSize.width * 0.85,
              child: TextFormField(
                controller: _mnemonicController,
                onChanged: (String? value) async {
                  setState(() {
                    _mnemonic = value;
                  });
                },
                style: const TextStyle(color: kFontBlue),
                cursorColor: kFontBlue,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: kFontBlue),
                  labelText: 'Backup Phrase',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: kFontBlue,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),
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
                          colors: [kFontBlue, kGradientBlue],
                          stops: [0.3, 1.0]),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FittedBox(child: Text('Create wallet')),
                    )),
                onTap: () {
                  if (_mnemonic != null) {
                    UserWallet newUser = args;
                    newUser.token = _mnemonic;
                    newUser.assetsList = [];
                    newUser.assetsList!.add('HoVsJrHg0LW66HexDQiH');
                    newUser.assetsList!.add('bHRW6Y66DJVOKus9g862');
                    newUser.assetsList!.add('u54SobOfFZybYFMRpt8E');
                    newUser.pin == null
                        ? newUser.enablePin = false
                        : newUser.enablePin = true;
                    sharedPref.save('userWallet', newUser);
                    newUser.saveData();
                    Navigator.of(context)
                        .pushNamed(AppRoutes.REDIRECTPAGE, arguments: false);
                  }
                },
              ))
        ],
      ),
    ));
  }
}
