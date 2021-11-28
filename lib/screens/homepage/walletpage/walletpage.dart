import 'package:flutter/material.dart';
import 'package:infinitywallet/core/coin_tile.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/core/shared_preferences.dart';
import 'package:infinitywallet/core/snack_bar.dart';
import 'package:infinitywallet/model/coin.dart';
import 'package:infinitywallet/model/user_wallet.dart';
import 'package:infinitywallet/model/user_wallet_manager.dart';
import 'package:infinitywallet/routes/routes.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  SharedPref sharedPref = SharedPref();
  UserWallet userWallet = UserWallet();
  Coin bitcoin =
      Coin('Bitcoin', 'BTC', '0xffffeb3b', 'assets/coins/bitcoin_logo.png', 'https://firebasestorage.googleapis.com/v0/b/infinity-wallet-232de.appspot.com/o/bitcoin.jpg?alt=media&token=b2de08c0-0a42-4164-bcd6-cc7514d014d8', '32EAbhyeGcb7SnSrqbLz7rEAbm7Gue99pE');

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.fullscreen),
                    onPressed: () {
                      showToast(context, 'Unavailable function.');
                    },
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kFrenchGrey)))),
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kFrenchGrey)))),
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kFrenchGrey)))),
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kFrenchGrey)))),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: IconButton(
                      onPressed: () {
                        showToast(context, 'Unavailable function.');
                      },
                      icon: const Icon(Icons.trending_up)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: IconButton(
                      onPressed: () {
                        showToast(context, 'Unavailable function.');
                      },
                      icon: const Icon(Icons.notifications)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: screenSize.width * 0.6,
              width: screenSize.width * 0.6,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kFrenchGrey,
                  ),
                  shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('${userWallet.walletName}',
                          style:
                              const TextStyle(color: kFontBlue, fontSize: 18))),
                  const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('\$ 0,000.00',
                          style: TextStyle(color: kWhitePC, fontSize: 27))),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                          '${userWallet.assetsList?.length.toString()} Assets',
                          style:
                              const TextStyle(color: kCoolGrey, fontSize: 18))),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kCoolGrey),
                              shape: BoxShape.circle),
                          child: FittedBox(
                              child: IconButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(AppRoutes.SENDPAGE,
                                          arguments: bitcoin),
                                  icon: const Icon(Icons.north_east)))),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text('Send')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kCoolGrey),
                              shape: BoxShape.circle),
                          child: FittedBox(
                              child: IconButton(
                                  onPressed: () {
                                    showToast(context, 'Unavailable function.');
                                  },
                                  icon: const Icon(Icons.swap_horiz)))),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text('Swap')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kCoolGrey),
                              shape: BoxShape.circle),
                          child: FittedBox(
                              child: IconButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(AppRoutes.RECEIVEPAGE,
                                          arguments: bitcoin),
                                  icon: const Icon(Icons.south_east)))),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text('Receive')),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 0.2,
              color: kCoolGrey,
              indent: 15,
              endIndent: 15,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                      padding: EdgeInsets.all(2),
                      child: Text('My Assets',
                          style: TextStyle(color: kWhitePC, fontSize: 20))),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: SizedBox(
                        child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, size: 20),
                          onPressed: () {
                            showToast(context, 'Unavailable function.');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, size: 20),
                          onPressed: () {
                            showToast(context, 'Unavailable function.');
                          },
                        )
                      ],
                    )),
                  )
                ],
              )),
          FutureBuilder<List?>(
              future:
                  UserWalletManager().getAssets(context, userWallet.assetsList),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done &&
                    snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: userWallet.assetsList!.length,
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
                    child: Text("You don't have any assets"),
                  );
                }
              }),
        ],
      ),
    );
  }
}
