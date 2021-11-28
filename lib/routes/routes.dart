// ignore_for_file: constant_identifier_names

import 'package:infinitywallet/screens/assetpage/assetpage.dart';
import 'package:infinitywallet/screens/homepage/homepage.dart';
import 'package:infinitywallet/screens/homepage/settingspage/accountsettings/account_settings_page.dart';
import 'package:infinitywallet/screens/homepage/settingspage/adressbooksettings/adress_book_settings.dart';
import 'package:infinitywallet/screens/homepage/settingspage/assetssettings/assets_settings_page.dart';
import 'package:infinitywallet/screens/homepage/settingspage/securitysettings/security_settings_page.dart';
import 'package:infinitywallet/screens/homepage/settingspage/walletbackupgsettings/vbs_page.dart';
import 'package:infinitywallet/screens/homepage/settingspage/walletbackupgsettings/wbs_page.dart';
import 'package:infinitywallet/screens/initialpage/create_wallet/backup_page.dart';
import 'package:infinitywallet/screens/initialpage/create_wallet/confirm_wallet.dart';
import 'package:infinitywallet/screens/initialpage/create_wallet/create_account_page.dart';
import 'package:infinitywallet/screens/initialpage/restore_wallet/choose_mnemonic_page.dart';
import 'package:infinitywallet/screens/initialpage/restore_wallet/import_mnemonic_page.dart';
import 'package:infinitywallet/screens/initialpage/initialpage.dart';
import 'package:infinitywallet/screens/initialpage/create_wallet/mnemonic_page.dart';
import 'package:infinitywallet/screens/initialpage/create_wallet/pinpage.dart';
import 'package:infinitywallet/screens/initialpage/redirect_create_page.dart';
import 'package:infinitywallet/screens/initialpage/redirect_page.dart';
import 'package:infinitywallet/screens/initialpage/restore_wallet/restore_account_page.dart';
import 'package:infinitywallet/screens/initialpage/restore_wallet/restore_pinpage.dart';
import 'package:infinitywallet/screens/initialpage/create_wallet/save_backup_page.dart';
import 'package:infinitywallet/screens/pinlogin/pinlogin_page.dart';
import 'package:infinitywallet/screens/receivepage/receivepage.dart';
import 'package:infinitywallet/screens/sendpage/sendpage.dart';

abstract class AppRoutes {
  //homepage screens
  static const String HOMEPAGE = 'HOMEPAGE';

  //general use screens
  static const String PINLOGINPAGE = 'PINLOGINPAGE';
  static const String SENDPAGE = 'SENDPAGE';
  static const String RECEIVEPAGE = 'RECEIVEPAGE';
  static const String ASSETPAGE = 'ASSETPAGE';

  //settings screens
  static const String ACCOUNTSETTINGSPAGE = 'ACCOUNTSETTINGSPAGE';
  static const String SECURITYSETTINGSPAGE = 'SECURITYSETTINGSPAGE';
  static const String ASSETSSETTINGSPAGE = 'ASSETSSETTINGSPAGE';
  static const String ADRESSBOOKSETTINGSPAGE = 'ADRESSBOOKSETTINGSPAGE';
  static const String WBSPAGE = 'WBSPAGE'; //WALLET BACKUP SETTINGS PAGE
  static const String VBSPAGE = 'VBSPAGE'; //VIEW BACKUP SETTINGS PAGE

  //initial screens
  static const String INITIALPAGE = 'INITIALPAGE';
  static const String REDIRECTCREATEPAGE = 'REDIRECTCREATEPAGE';
  static const String RESTOREACCOUNTPAGE = 'RESTOREACCOUNTPAGE';
  //restore wallet
  static const String RESTOREPINPAGE = 'RESTOREPINPAGE';
  static const String CHOOSEMNEMONICPAGE = 'CHOOSEMNEMONICPAGE';
  static const String IMPORTMNEMONICPAGE = 'IMPORTMNEMONICPAGE';
  //create new wallet
  static const String CREATEACCOUNTPAGE = 'CREATEACCOUNTPAGE';
  static const String PINPAGE = 'PINPAGE';
  static const String MNEMONICPAGE = 'MNEMONICPAGE';
  static const String BACKUPPAGE = 'BACKUPPAGE';
  static const String SAVEBACKUPPAGE = 'SAVEBACKUPPAGE';
  static const String CONFIRMWALLET = 'CONFIRMWALLET';
  static const String REDIRECTPAGE = 'REDIRECTPAGE';

  static final routes = {
    //homepage screens
    HOMEPAGE: (context) => const HomePage(),

    //general use screens
    PINLOGINPAGE: (context) => const PinLoginPage(),
    SENDPAGE: (context) => const SendPage(),
    RECEIVEPAGE: (context) => const ReceivePage(),
    ASSETPAGE: (context) => const AssetPage(),

    //settings screens
    ACCOUNTSETTINGSPAGE: (context) => const AccountSettingsPage(),
    SECURITYSETTINGSPAGE: (context) => const SecuritySettingsPage(),
    ASSETSSETTINGSPAGE: (context) => const AssetsSettingsPage(),
    ADRESSBOOKSETTINGSPAGE: (context) => const AdressBookSettingsPage(),
    WBSPAGE: (context) => const WBSPage(),
    VBSPAGE: (context) => const VBSPage(),

    //initial screens
    INITIALPAGE: (context) => const InitialPage(),
    REDIRECTCREATEPAGE: (context) => const RedirectCreatePage(),
    //import wallet
    RESTOREACCOUNTPAGE: (context) => const RestoreAccountPage(),
    RESTOREPINPAGE: (context) => const RestorePinPage(),
    CHOOSEMNEMONICPAGE: (context) => const ChooseMnemonicPage(),
    IMPORTMNEMONICPAGE: (context) => const ImportMnemonicPage(),
    //create new wallet
    CREATEACCOUNTPAGE: (context) => const CreateAccountPage(),
    PINPAGE: (context) => const PinPage(),
    MNEMONICPAGE: (context) => const MnemonicPage(),
    BACKUPPAGE: (context) => const BackupPage(),
    SAVEBACKUPPAGE: (context) => const SaveBackupPage(),
    CONFIRMWALLET: (context) => const ConfirmWallet(),
    REDIRECTPAGE: (context) => const RedirectPage(),
  };
}
