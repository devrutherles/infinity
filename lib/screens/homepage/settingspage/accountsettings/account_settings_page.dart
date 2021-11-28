import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/shared_preferences.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/routes/routes.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  SharedPref sharedPref = SharedPref();
  final int _index = 0;
  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16, 16, 4),
            child: Align(
                alignment: Alignment.centerLeft,
                child: InitialMainText(title: 'Language')),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                  child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.85,
                      decoration: BoxDecoration(
                          border: Border.all(color: kFontBlue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/icons/usa_flag_icon.png'),
                        ),
                        title: Text('English (United States)'),
                        trailing: Icon(Icons.expand_more),
                      )),
                  onTap: () => showToast(context, 'Unavailable function.'))),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16, 16, 4),
            child: Align(
                alignment: Alignment.centerLeft,
                child: InitialMainText(title: 'Currency')),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                  child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.85,
                      decoration: BoxDecoration(
                          border: Border.all(color: kFontBlue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/icons/usa_flag_icon.png'),
                        ),
                        title: Text('American Dollar (USD)'),
                        trailing: Icon(Icons.expand_more),
                      )),
                  onTap: () => showToast(context, 'Unavailable function.'))),
          const Divider(
            thickness: 0.2,
            color: kFontBlue,
            indent: 20,
            endIndent: 20,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16, 16, 4),
            child: Align(
                alignment: Alignment.centerLeft,
                child: InitialMainText(title: 'Themes')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                        child: Container(
                          height: screenSize.width * 0.15,
                          width: screenSize.width * 0.15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _index == 0 ? kFontBlue : kFrenchGrey),
                              gradient: const LinearGradient(
                                  colors: [kBackgroundColor, kFontBlue])),
                        ),
                        onTap: () =>
                            showToast(context, 'Theme already selected!'))),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                        child: Container(
                          height: screenSize.width * 0.15,
                          width: screenSize.width * 0.15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _index == 1 ? kFontBlue : kFrenchGrey),
                              gradient: const LinearGradient(
                                  colors: [kBackgroundColor, kCoolGrey])),
                        ),
                        onTap: () =>
                            showToast(context, 'Unavailable function.'))),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                        child: Container(
                          height: screenSize.width * 0.15,
                          width: screenSize.width * 0.15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _index == 1 ? kFontBlue : kFrenchGrey),
                              gradient: const LinearGradient(
                                  colors: [kWhitePC, kCoolGrey])),
                        ),
                        onTap: () =>
                            showToast(context, 'Unavailable function.'))),
              ],
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                  child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.5,
                      decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const FittedBox(
                        child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Log Out')),
                      )),
                  onTap: () {
                    sharedPref.remove('userWallet');
                    Navigator.of(context).pushNamed(AppRoutes.INITIALPAGE);
                  }))
        ],
      ))),
    );
  }
}
