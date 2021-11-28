import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/shared_preferences.dart';
import 'package:infinitywallet/model/user_wallet.dart';

class SecuritySettingsPage extends StatefulWidget {
  const SecuritySettingsPage({Key? key})
      : super(key: key);

  @override
  _SecuritySettingsPageState createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends State<SecuritySettingsPage> {
  SharedPref sharedPref = SharedPref();

  @override
  Widget build(BuildContext context) {
    final userWallet = ModalRoute.of(context)!.settings.arguments as UserWallet;
    bool _switchValue = userWallet.enablePin!;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
              child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenSize.width * 0.6,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Change your password',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Start password setup process',
                            style: TextStyle(fontSize: 14, color: kCoolGrey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                        height: screenSize.height * 0.06,
                        width: screenSize.width * 0.3,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: LinearGradient(
                              colors: [kFontBlue, kGradientBlue],
                              stops: [0.3, 1.0]),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: FittedBox(child: Text('Change password')))),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.2,
            color: kFontBlue,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenSize.width * 0.6,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Enable wallet PIN',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      FittedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Secure this wallet with a 4 to 8 digit PIN',
                              style: TextStyle(fontSize: 14, color: kCoolGrey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                        userWallet.enablePin = _switchValue;
                        sharedPref.save('userWallet', userWallet);
                      },
                      activeTrackColor: kCoolGrey,
                      activeColor: kFontBlue,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenSize.width * 0.6,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Change your PIN',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      FittedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Change your PIN or create a new one',
                              style: TextStyle(fontSize: 14, color: kCoolGrey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                        height: screenSize.height * 0.06,
                        width: screenSize.width * 0.3,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: LinearGradient(
                              colors: [kFontBlue, kGradientBlue],
                              stops: [0.3, 1.0]),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: FittedBox(child: Text('Change PIN')))),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.2,
            color: kFontBlue,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ))),
    );
  }
}
