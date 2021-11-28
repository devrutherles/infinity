import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_subtitle_text.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/coin.dart';

class SendPage extends StatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  _SendPageState createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  String? _token;
  late TextEditingController _tokenController;

  @override
  void initState() {
    super.initState();
    _tokenController = TextEditingController();
  }

  @override
  void dispose() {
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Coin;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SizedBox.expand(
                child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
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
                  child: Image.asset('assets/icons/infinity_wallet_icon.png')),
            ),
            const Spacer(flex: 4),
          ]),
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
                height: screenSize.height * 0.2,
                width: screenSize.height * 0.2,
                child: FittedBox(
                  child: CircleAvatar(
                    backgroundColor: kBarsColor,
                    backgroundImage: AssetImage(args.icon!),
                  ),
                ))),
        InitialMainText(title: 'Send ${args.name} (${args.initials})'),
        const InitialSubtitleText(
            subtitle:
                'Paste, scan or select a receiver address from your contact book.'),
        Padding(
            padding: const EdgeInsets.all(15),
            child: Text('${args.initials} address:')),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: screenSize.height * 0.07,
                width: screenSize.width * 0.5,
                child: TextFormField(
                  controller: _tokenController,
                  onChanged: (String? value) async {
                    setState(() {
                      _token = value;
                    });
                  },
                  style: const TextStyle(color: kFontBlue),
                  cursorColor: kFontBlue,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.copy, color: kFrenchGrey),
                      onPressed: () async {
                        ClipboardData? cdata =
                            await Clipboard.getData(Clipboard.kTextPlain);
                        String copiedtext = cdata!.text!;
                        setState(() {
                          _token = copiedtext;
                        });
                      },
                    ),
                    labelStyle: const TextStyle(color: kFontBlue),
                    labelText: 'Enter address',
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
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              color: Color(int.parse(args.initialsColor!)))),
                      child: Icon(Icons.person,
                          color: Color(int.parse(args.initialsColor!)))),
                  onTap: () {
                    showToast(context, 'Unavailable function.');
                  },
                )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  child: Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              color: Color(int.parse(args.initialsColor!)))),
                      child: Icon(Icons.fullscreen,
                          color: Color(int.parse(args.initialsColor!)))),
                  onTap: () {
                    showToast(context, 'Unavailable function.');
                  },
                )),
          ],
        ),
      ],
    ))));
  }
}
