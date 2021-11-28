import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/coin.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({Key? key}) : super(key: key);

  @override
  _ReceivePageState createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
  int _index = 0;

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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: _index == 0 ? kCoolGrey : kFontBlue),
                onPressed: () {
                  setState(() {
                    _index = _index - 1;
                  });
                },
              ),
              SizedBox(
                  height: screenSize.height * 0.2,
                  width: screenSize.height * 0.2,
                  child: FittedBox(
                    child: _index == 0
                        ? Image.network(args.qrcode!)
                        : Image.asset('assets/second_qr_code.png'),
                  )),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios,
                    color: _index == 1 ? kCoolGrey : kFontBlue),
                onPressed: () {
                  setState(() {
                    _index = _index + 1;
                  });
                },
              )
            ],
          ),
        ),
        _index == 0
            ? InitialMainText(title: 'Your ${args.initials} address')
            : InitialMainText(title: 'Your bech32 ${args.initials} address'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: screenSize.height * 0.07,
            width: screenSize.width * 0.85,
            decoration: const BoxDecoration(
              color: kCoolGrey,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ListTile(
              title: Center(
                child: FittedBox(
                  child: Text(args.token!,
                      style: TextStyle(
                          color: Color(int.parse(args.initialsColor!)))),
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.copy,
                  color: Color(int.parse(args.initialsColor!)),
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: args.token));
                  showToast(context, 'Copied!');
                },
              ),
            ),
          ),
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
      ],
    ))));
  }
}
