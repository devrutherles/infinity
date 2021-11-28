import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class PinLoginPage extends StatefulWidget {
  const PinLoginPage({Key? key}) : super(key: key);

  @override
  _PinLoginPageState createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  int _index = 0;
  String? pin = '';

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
          const InitialMainText(title: 'Wallet PIN'),
          const InitialSubtitleText(subtitle: 'Enter your wallet PIN'),
          //counter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 0
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 1
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 2
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 3
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 4
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 5
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 6
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 7
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index > 8
                        ? Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFontBlue,
                                border: Border.all(color: kFrenchGrey)))
                        : Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kFrenchGrey)))),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: screenSize.height * 0.35,
                width: screenSize.width * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('1')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}1';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            }),
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('2')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}2';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            }),
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('3')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}3';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('4')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}4';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            }),
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('5')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}5';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            }),
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('6')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}6';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('7')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}7';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            }),
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('8')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}8';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            }),
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('9')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}9';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Icon(Icons.backspace)))),
                            onTap: () {
                              setState(() {
                                if (pin!.isNotEmpty) {
                                  _index = _index - 1;
                                  pin = pin!.substring(0, pin!.length - 1);
                                } else {
                                  showToast(context, 'Invalid Option');
                                }
                              });
                            }),
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kCoolGrey),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text('0')))),
                            onTap: () {
                              if (_index < 8) {
                                setState(() {
                                  _index = _index + 1;
                                  pin = '${pin}0';
                                });
                              } else {
                                showToast(context, 'Invalid option!');
                              }
                            }),
                        GestureDetector(
                            child: Container(
                                height: screenSize.width * 0.15,
                                width: screenSize.width * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    color:
                                        _index >= 4 ? kCoolGrey : kBarsColor),
                                child: const FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Icon(Icons.check)))),
                            onTap: () {
                              if (_index > 3) {
                                if (pin == args.pin) {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.VBSPAGE,
                                      arguments: args);
                                } else {
                                  showToast(context, 'Invalid PIN');
                                }
                              } else {
                                showToast(context,
                                    'PIN requires at least 4 characters');
                              }
                            })
                      ],
                    ),
                  ],
                ),
              )),
        ],
      )),
    ));
  }
}
