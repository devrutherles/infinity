import 'package:cloud_firestore/cloud_firestore.dart';

class Coin {
  String? name;
  String? initials;
  String? initialsColor;
  String? icon;
  String? qrcode;
  String? token;

  Coin(this.name, this.initials, this.initialsColor, this.icon, this.qrcode,
      this.token);

  Coin.fromDocument(DocumentSnapshot document) {
    Map doc = document.data() as Map;
    name = doc['name'];
    initials = doc['initials'];
    initialsColor = doc['initialsColor'];
    icon = doc['icon'];
    qrcode = doc['qrcode'];
    token = doc['token'];
  }
}
