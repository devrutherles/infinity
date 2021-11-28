import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/routes/routes.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: kFontBlue, fontSize: 16),
                  ),
                  onPressed: () => Navigator.of(context)
                      .pushNamed(AppRoutes.REDIRECTCREATEPAGE)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
                height: screenSize.width * 0.3,
                width: screenSize.width * 0.7,
                child: Image.asset('assets/icons/infinity_wallet_icon.png')),
          ),
          // main text
          _index == 0
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Digital asset Wallet',
                      style: TextStyle(fontSize: 22)),
                )
              : _index == 1
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Private & secure',
                          style: TextStyle(fontSize: 22)),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text('Your future', style: TextStyle(fontSize: 22)),
                    ),
          _index == 0
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'A shophisticated an pratical non-custodial wallet to manage\nall your digital assets.',
                    style: TextStyle(fontSize: 14, color: kCoolGrey),
                    textAlign: TextAlign.center,
                  ),
                )
              : _index == 1
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Your personal wallet secured and ready for use in your own\nprivate environment.',
                        style: TextStyle(fontSize: 14, color: kCoolGrey),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'The infinity wallet is the ultimate one-stop application for all\nyour digital asset needs!',
                        style: TextStyle(fontSize: 14, color: kCoolGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (_index != 0)
                  GestureDetector(
                      child: Container(
                        height: screenSize.height * 0.06,
                        width: screenSize.width * 0.3,
                        decoration: const BoxDecoration(
                            color: kCoolGrey,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const FittedBox(
                            child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Back'),
                        )),
                      ),
                      onTap: () => setState(() {
                            _index = _index - 1;
                          })),
                GestureDetector(
                    child: Container(
                      height: screenSize.height * 0.06,
                      width: screenSize.width * 0.3,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [kFontBlue, kGradientBlue],
                              stops: [0.3, 1.0]),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const FittedBox(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Continue'),
                      )),
                    ),
                    onTap: () {
                      _index == 2
                          ? Navigator.of(context)
                              .pushNamed(AppRoutes.REDIRECTCREATEPAGE)
                          : setState(() {
                              _index = _index + 1;
                            });
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: _index == 0
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
                    child: _index == 1
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
                    child: _index == 2
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
        ],
      ),
    )));
  }
}
