import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/screens/homepage/historypage/history_page.dart';
import 'package:infinitywallet/screens/homepage/infopage/infopage.dart';
import 'package:infinitywallet/screens/homepage/settingspage/settingspage.dart';
import 'package:infinitywallet/screens/homepage/swappage/swap_page.dart';
import 'package:infinitywallet/screens/homepage/walletpage/walletpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  //screens list
  List<Widget> screens = [
    Builder(builder: (context) => const WalletPage()),
    Builder(builder: (context) => const HistoryPage()),
    Builder(builder: (context) => const SwapPage()),
    Builder(builder: (context) => const InfoPage()),
    Builder(builder: (context) => const SettingsPage()),
  ];

  //index tap
  void tabTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kBarsColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          currentIndex: _index,
          onTap: tabTapped,
          items: [
            BottomNavigationBarItem(
                icon: _index == 0
                    ? const Icon(Icons.account_balance_wallet,
                        color: kFrenchGrey)
                    : const Icon(Icons.account_balance_wallet,
                        color: kCoolGrey),
                label: 'Wallets'),
            BottomNavigationBarItem(
                icon: _index == 1
                    ? const Icon(Icons.history, color: kFrenchGrey)
                    : const Icon(Icons.history, color: kCoolGrey),
                label: 'History'),
            BottomNavigationBarItem(
                icon: _index == 2
                    ? const Icon(Icons.swap_vert, color: kFrenchGrey)
                    : const Icon(Icons.swap_vert, color: kCoolGrey),
                label: 'Swap'),
            BottomNavigationBarItem(
                icon: _index == 3
                    ? const Icon(Icons.info, color: kFrenchGrey)
                    : const Icon(Icons.info, color: kCoolGrey),
                label: 'Coins'),
            BottomNavigationBarItem(
                icon: _index == 4
                    ? const Icon(Icons.apps, color: kFrenchGrey)
                    : const Icon(Icons.apps, color: kCoolGrey),
                label: 'wallet'),
          ]),
    );
  }
}
