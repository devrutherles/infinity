import 'package:flutter/material.dart';
import 'package:infinitywallet/core/coin_tile.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/initial%20page%20widgets/initial_main_text.dart';
import 'package:infinitywallet/model/user_wallet_manager.dart';

class AssetsSettingsPage extends StatefulWidget {
  const AssetsSettingsPage({Key? key}) : super(key: key);

  @override
  _AssetsSettingsPageState createState() => _AssetsSettingsPageState();
}

class _AssetsSettingsPageState extends State<AssetsSettingsPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 32),
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
            const Divider(
              thickness: 0.2,
              color: kFontBlue,
              indent: 20,
              endIndent: 20,
            ),
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
      ),
    ));
  }
}
