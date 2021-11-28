import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_picture.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/routes/routes.dart';

class RestoreAccountPage extends StatefulWidget {
  const RestoreAccountPage({Key? key}) : super(key: key);

  @override
  _RestoreAccountPageState createState() => _RestoreAccountPageState();
}

class _RestoreAccountPageState extends State<RestoreAccountPage> {
  String? _walletName;
  late TextEditingController _walletNameController;

  @override
  void initState() {
    super.initState();
    _walletNameController = TextEditingController();
  }

  @override
  void dispose() {
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
          const InitialPicture(picture: 'assets/icons/wallet_icon.png'),
          const InitialMainText(title: 'Name your wallet'),
          const InitialSubtitleText(subtitle: 'Give your wallet a nice name'),
          Padding(
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
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
            child: GestureDetector(
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
                  if (_walletName != null) {
                    UserWallet newWallet = UserWallet();
                    newWallet.walletName = _walletName;
                    Navigator.of(context).pushNamed(AppRoutes.RESTOREPINPAGE,
                        arguments: newWallet);
                  } else {
                    showToast(context, 'Invalid wallet name');
                  }
                }),
          ),
        ],
      )),
    );
  }
}
