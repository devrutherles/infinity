import 'package:cloud_firestore/cloud_firestore.dart';

class UserWallet {
  String? name;
  String? password;
  String? walletName;
  String? token;
  bool? tokenType;
  String? pin;
  bool? enablePin;
  List<dynamic>? assetsList;

  UserWallet();

  UserWallet.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'],
        walletName = json['walletName'],
        token = json['token'],
        tokenType = json['tokenType'],
        pin = json['pin'],
        enablePin = json['enablePin'],
        assetsList = json['assetsList'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
        'walletName': walletName,
        'token': token,
        'tokenType': tokenType,
        'pin': pin,
        'enablePin': enablePin,
        'assetsList': assetsList,
      };

  toMap() {
    return {
      'walletName': walletName,
      'token': token,
    };
  }

  Future<void> saveData() async {
    await FirebaseFirestore.instance.collection('wallets').add(toMap());
    // ignore: avoid_print
    print('saved data');
  }
}
