import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';

class AdressBookSettingsPage extends StatefulWidget {
  const AdressBookSettingsPage({Key? key}) : super(key: key);

  @override
  _AdressBookSettingsPageState createState() => _AdressBookSettingsPageState();
}

class _AdressBookSettingsPageState extends State<AdressBookSettingsPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SizedBox.expand(
                child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 16, 4, 0),
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
        const Spacer(),
        Container(
            height: screenSize.width * 0.4,
            width: screenSize.width * 0.4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [kFontBlue, kGradientBlue], stops: [0.3, 1.0]),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: FittedBox(
                child: Icon(Icons.smartphone),
              ),
            )),
        const InitialMainText(title: 'No contacts in your adress book'),
        const InitialSubtitleText(
            subtitle: 'You can add contacts to your addressbook clicking here'),
        const Spacer(),
      ],
    ))));
  }
}
