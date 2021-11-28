// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_picture.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int _index = 0;
  String? _name;
  String? _password;
  String? _confirmPassword;
  String? _walletName;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _walletNameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _walletNameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _walletNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            //pictures
            _index == 0
                ? const InitialPicture(picture: 'assets/icons/profile_icon.png')
                : _index == 1 || _index == 2
                    ? const InitialPicture(
                        picture: 'assets/icons/lock_icon.png')
                    : const InitialPicture(
                        picture: 'assets/icons/wallet_icon.png'),
            //titles
            _index == 0
                ? const InitialMainText(title: 'Create local account')
                : _index == 1
                    ? const InitialMainText(title: 'Account password')
                    : _index == 2
                        ? const InitialMainText(title: 'Confirm your password')
                        : const InitialMainText(title: 'Name your wallet'),
            //subtitles
            _index == 0
                ? const InitialSubtitleText(
                    subtitle: 'Enter a user name for your local account')
                : _index == 1
                    ? const InitialSubtitleText(
                        subtitle: 'Enter your account password')
                    : _index == 2
                        ? const InitialSubtitleText(
                            subtitle: 'Repeat your account password')
                        : const InitialSubtitleText(
                            subtitle: 'Give your wallet a nice name'),
            //text form fields
            _index == 0
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.85,
                      child: TextFormField(
                        controller: _nameController,
                        onChanged: (String? value) async {
                          setState(() {
                            _name = value;
                          });
                        },
                        style: const TextStyle(color: kFontBlue),
                        cursorColor: kFontBlue,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: kFontBlue),
                          labelText: 'User name',
                          prefixIcon: Icon(Icons.person, color: kFontBlue),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: kFontBlue,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ),
                  )
                : _index == 1
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: screenSize.height * 0.07,
                          width: screenSize.width * 0.85,
                          child: TextFormField(
                            controller: _passwordController,
                            onChanged: (String? value) async {
                              setState(() {
                                _password = value;
                              });
                            },
                            style: const TextStyle(color: kFontBlue),
                            cursorColor: kFontBlue,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: kFontBlue),
                              labelText: 'Password',
                              suffixIcon:
                                  Icon(Icons.visibility, color: kFontBlue),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: kFontBlue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ),
                      )
                    : _index == 2
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              height: screenSize.height * 0.07,
                              width: screenSize.width * 0.85,
                              child: TextFormField(
                                validator: (value) {
                                  if (value != _password) {
                                    return 'Password mismatch';
                                  }
                                },
                                controller: _confirmPasswordController,
                                onChanged: (String? value) async {
                                  setState(() {
                                    _confirmPassword = value;
                                  });
                                },
                                style: const TextStyle(color: kFontBlue),
                                cursorColor: kFontBlue,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: kFontBlue),
                                  labelText: 'Confirm password',
                                  suffixIcon:
                                      Icon(Icons.visibility, color: kFontBlue),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: kFontBlue,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      )),
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              height: screenSize.height * 0.07,
                              width: screenSize.width * 0.85,
                              child: TextFormField(
                                controller: _walletNameController,
                                onChanged: (String? value) async {
                                  setState(() {
                                    _walletName = value;
                                  });
                                },
                                style: const TextStyle(color: kFontBlue),
                                cursorColor: kFontBlue,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: kFontBlue),
                                  labelText: 'Wallet name',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: kFontBlue,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      )),
                                ),
                              ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
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
                        if (_index == 3) {
                          UserWallet newWallet = UserWallet();
                          if (_name != null) {
                            newWallet.name = _name;
                          } else {
                            showToast(context, 'Invalid name');
                          }
                          if (_password != null) {
                            newWallet.password = _password;
                          } else {
                            showToast(context, 'Invalid password');
                          }
                          if (_walletName != null) {
                            newWallet.walletName = _walletName;
                          } else {
                            showToast(context, 'Invalid wallet name');
                          }
                          Navigator.of(context).pushNamed(AppRoutes.PINPAGE,
                              arguments: newWallet);
                        } else {
                          setState(() {
                            _index = _index + 1;
                          });
                        }
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
                  Padding(
                      padding: const EdgeInsets.all(2),
                      child: _index == 3
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
      ),
    );
  }
}
