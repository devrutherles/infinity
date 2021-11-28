import 'package:flutter/material.dart';
import 'package:infinitywallet/core/colors/colors.dart';
import 'package:infinitywallet/model/coin.dart';
import 'package:infinitywallet/routes/routes.dart';

class CoinTile extends StatefulWidget {
  final Coin data;
  const CoinTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _CoinTileState createState() => _CoinTileState();
}

class _CoinTileState extends State<CoinTile> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      child: GestureDetector(
        child: Container(
          height: screenSize.height * 0.08,
          width: screenSize.width * 0.6,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: kBarsColor,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: kBarsColor,
              backgroundImage: AssetImage(widget.data.icon!),
            ),
            title: Text(widget.data.name!),
            subtitle: Text(widget.data.initials!,
                style: TextStyle(
                    color: Color(int.parse(widget.data.initialsColor!)))),
            trailing: Text('0.0 ${widget.data.initials!}'),
          ),
        ),
        onTap: () => Navigator.of(context)
            .pushNamed(AppRoutes.ASSETPAGE, arguments: widget.data),
      ),
    );
  }
}
