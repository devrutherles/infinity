import 'package:flutter/material.dart';
import 'package:infinitywallet/core/coin_tile.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/model/user_wallet_manager.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 45, 16, 16),
              child: SizedBox(
                  height: screenSize.height * 0.07,
                  width: screenSize.width * 0.15,
                  child: Image.asset('assets/infinity_official_logo.png'))),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: InitialMainText(title: 'All assets'),
          ),
          FutureBuilder<List?>(
              future: UserWalletManager().getAllAssets(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done &&
                    snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CoinTile(data: snapshot.data![index]);
                      });
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(
                        color: kFontBlue,
                      ));
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Error loading Assets"),
                  );
                }
              }),
        ],
      ),
    ));
  }
}
