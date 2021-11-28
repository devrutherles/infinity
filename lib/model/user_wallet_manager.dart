import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinitywallet/model/coin.dart';

class UserWalletManager {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference coins = FirebaseFirestore.instance.collection("assets");

  Future<List?> getAssets(BuildContext context, List<dynamic>? idsRefs) async {
    List<Coin> assets = [];
    try {
      if (idsRefs!.isNotEmpty) {
        for (var id in idsRefs) {
          assets.add(Coin.fromDocument(
              await firestore.collection("assets").doc(id).get()));
        }
      }
      return assets;
    } catch (err) {
      // ignore: avoid_print
      print("[Error] - Failed to get assets data: $err");
    }
  }

  Future<List<Coin>> getAllAssets() async {
    List<Coin> assets = [];
    var collection = FirebaseFirestore.instance.collection('assets');
    var documents = await collection.get();

    for (var doc in documents.docs) {
      assets.add(Coin.fromDocument(doc));
    }

    return assets;
  }
}
