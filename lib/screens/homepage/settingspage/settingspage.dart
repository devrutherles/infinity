import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/shared_preferences.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPref sharedPref = SharedPref();
  UserWallet userWallet = UserWallet();

  loadSharedPrefs() async {
    try {
      UserWallet user =
          UserWallet.fromJson(await sharedPref.read('userWallet'));
      // ignore: avoid_print
      print('Loaded!');
      setState(() {
        userWallet = user;
      });
    } on Exception {
      // ignore: avoid_print
      print('Nothing Found! (?)');
    }
  }

  @override
  void initState() {
    super.initState();
    loadSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: (SizedBox.expand(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                  height: screenSize.height * 0.07,
                  width: screenSize.width * 0.15,
                  child: Image.asset('assets/infinity_official_logo.png'))),
          const Divider(
            thickness: 0.2,
            color: kFontBlue,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: GestureDetector(
                  child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.8,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kCoolGrey,
                      ),
                      child: const ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Account Settings',
                              style: TextStyle(color: kWhitePC)))),
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.ACCOUNTSETTINGSPAGE))),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: GestureDetector(
                child: Container(
                    height: screenSize.height * 0.07,
                    width: screenSize.width * 0.8,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kCoolGrey,
                    ),
                    child: const ListTile(
                        leading: Icon(Icons.security),
                        title: Text('Security',
                            style: TextStyle(color: kWhitePC)))),
                onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.SECURITYSETTINGSPAGE,
                    arguments: userWallet),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: GestureDetector(
                child: Container(
                    height: screenSize.height * 0.07,
                    width: screenSize.width * 0.8,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kCoolGrey,
                    ),
                    child: const ListTile(
                        leading: Icon(Icons.monetization_on),
                        title:
                            Text('Assets', style: TextStyle(color: kWhitePC)))),
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRoutes.ASSETSSETTINGSPAGE),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: GestureDetector(
                child: Container(
                    height: screenSize.height * 0.07,
                    width: screenSize.width * 0.8,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kCoolGrey,
                    ),
                    child: const ListTile(
                        leading: Icon(Icons.lock),
                        title: Text('Adress Book',
                            style: TextStyle(color: kWhitePC)))),
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRoutes.ADRESSBOOKSETTINGSPAGE),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: GestureDetector(
                child: Container(
                    height: screenSize.height * 0.07,
                    width: screenSize.width * 0.8,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kCoolGrey,
                    ),
                    child: const ListTile(
                        leading: Icon(Icons.backup),
                        title: Text('Wallet Backup',
                            style: TextStyle(color: kWhitePC)))),
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRoutes.WBSPAGE, arguments: userWallet),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: GestureDetector(
                child: Container(
                    height: screenSize.height * 0.07,
                    width: screenSize.width * 0.8,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kCoolGrey,
                    ),
                    child: const ListTile(
                        leading: Icon(Icons.backup),
                        title: Text('Import Wallet',
                            style: TextStyle(color: kWhitePC)))),
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRoutes.REDIRECTCREATEPAGE),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: GestureDetector(
                  child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.8,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kCoolGrey,
                      ),
                      child: const ListTile(
                          leading: Icon(Icons.help),
                          title: Text('Support',
                              style: TextStyle(color: kWhitePC)))))),
        ],
      ))),
    );
  }
}
