// ignore_for_file: unused_field

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/shared_preferences.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

List<int> randomGen12() {
  List<int> rands = [];
  var rng = Random();
  rands.add(rng.nextInt(12));
  rands.add(rng.nextInt(12));
  while (rands[1] == rands[0]) {
    rands[1] == rng.nextInt(12);
  }
  rands.add(rng.nextInt(12));
  while (rands[2] == rands[0] || rands[2] == rands[1]) {
    rands[2] == rng.nextInt(12);
  }
  rands.add(rng.nextInt(12));
  while (rands[3] == rands[0] || rands[3] == rands[1] || rands[3] == rands[2]) {
    rands[2] == rng.nextInt(12);
  }
  return rands;
}

List<int> randomGen24() {
  List<int> rands = [];
  var rng = Random();
  rands.add(rng.nextInt(24));
  rands.add(rng.nextInt(24));
  while (rands[1] == rands[0]) {
    rands[1] == rng.nextInt(24);
  }
  rands.add(rng.nextInt(24));
  while (rands[2] == rands[0] || rands[2] == rands[1]) {
    rands[2] == rng.nextInt(24);
  }
  rands.add(rng.nextInt(24));
  while (rands[3] == rands[0] || rands[3] == rands[1] || rands[3] == rands[2]) {
    rands[2] == rng.nextInt(24);
  }
  return rands;
}

class ConfirmWallet extends StatefulWidget {
  const ConfirmWallet({Key? key}) : super(key: key);

  @override
  _ConfirmWalletState createState() => _ConfirmWalletState();
}

class _ConfirmWalletState extends State<ConfirmWallet> {
  List<int> numbers = randomGen12();
  List<int> numbers24 = randomGen24();
  String? _stToken;
  String? _ndToken;
  String? _rdToken;
  String? _thToken;
  late TextEditingController _stTokenController;
  late TextEditingController _ndTokenController;
  late TextEditingController _rdTokenController;
  late TextEditingController _thTokenController;

  @override
  void initState() {
    super.initState();
    _stTokenController = TextEditingController();
    _ndTokenController = TextEditingController();
    _rdTokenController = TextEditingController();
    _thTokenController = TextEditingController();
  }

  @override
  void dispose() {
    _stTokenController.dispose();
    _ndTokenController.dispose();
    _rdTokenController.dispose();
    _thTokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = SharedPref();
    final args = ModalRoute.of(context)!.settings.arguments as UserWallet;
    List<String> mnemonic = args.token!.split(' ');
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
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
          const InitialMainText(title: 'Confirm your backup phrase'),
          const InitialSubtitleText(
              subtitle: 'Please re-enter your 12 word backup phrase'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: screenSize.height * 0.07,
              width: screenSize.width * 0.85,
              child: TextFormField(
                controller: _stTokenController,
                onChanged: (String? value) async {
                  setState(() {
                    _stToken = value;
                  });
                },
                style: const TextStyle(color: kFontBlue),
                cursorColor: kFontBlue,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: kFontBlue),
                  labelText: args.tokenType == false
                      ? '${numbers[0] + 1}'
                      : '${numbers24[0] + 1}',
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: kFontBlue,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: screenSize.height * 0.07,
              width: screenSize.width * 0.85,
              child: TextFormField(
                controller: _ndTokenController,
                onChanged: (String? value) async {
                  setState(() {
                    _ndToken = value;
                  });
                },
                style: const TextStyle(color: kFontBlue),
                cursorColor: kFontBlue,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: kFontBlue),
                  labelText: args.tokenType == false
                      ? '${numbers[1] + 1}'
                      : '${numbers24[1] + 1}',
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: kFontBlue,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: screenSize.height * 0.07,
              width: screenSize.width * 0.85,
              child: TextFormField(
                controller: _rdTokenController,
                onChanged: (String? value) async {
                  setState(() {
                    _rdToken = value;
                  });
                },
                style: const TextStyle(color: kFontBlue),
                cursorColor: kFontBlue,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: kFontBlue),
                  labelText: args.tokenType == false
                      ? '${numbers[2] + 1}'
                      : '${numbers24[2] + 1}',
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: kFontBlue,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: screenSize.height * 0.07,
              width: screenSize.width * 0.85,
              child: TextFormField(
                controller: _thTokenController,
                onChanged: (String? value) async {
                  setState(() {
                    _thToken = value;
                  });
                },
                style: const TextStyle(color: kFontBlue),
                cursorColor: kFontBlue,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: kFontBlue),
                  labelText: args.tokenType == false
                      ? '${numbers[3] + 1}'
                      : '${numbers24[3] + 1}',
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: kFontBlue,
                      )),
                  enabledBorder: const OutlineInputBorder(
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
                  if (args.tokenType == false) {
                    if (_stToken == mnemonic[numbers[0]] &&
                        _ndToken == mnemonic[numbers[1]] &&
                        _rdToken == mnemonic[numbers[2]] &&
                        _thToken == mnemonic[numbers[3]]) {
                      UserWallet newUser = args;
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
                          .pushNamed(AppRoutes.REDIRECTPAGE, arguments: true);
                    } else {
                      showToast(context, 'Invalid Input');
                    }
                  } else {
                    if (_stToken == mnemonic[numbers24[0]] &&
                        _ndToken == mnemonic[numbers24[1]] &&
                        _rdToken == mnemonic[numbers24[2]] &&
                        _thToken == mnemonic[numbers24[3]]) {
                      UserWallet newUser = args;
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
                          .pushNamed(AppRoutes.REDIRECTPAGE, arguments: true);
                    } else {
                      showToast(context, 'Invalid Input');
                    }
                  }
                },
              ))
        ],
      ),
    ));
  }
}
