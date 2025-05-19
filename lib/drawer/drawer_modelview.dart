import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar_viewmodel.dart';
import 'package:ltdmed/l10n/langvar.dart';

class DrawerModelView with ChangeNotifier {
  static DrawerModelView? _instance;
  static DrawerModelView get instance {
    _instance ??= DrawerModelView();
    return _instance!;
  }

  Future<void> init() async {
    if (_userInfo.isNotEmpty) {
      return;
    }

    _homePage = await LangUtility.getString(
      LangVar.homePage,
      AppbarViewmodel.instance.currentLang,
    );

    _userInfo = await LangUtility.getString(
      LangVar.userInfo,
      AppbarViewmodel.instance.currentLang,
    );

    _healthRecord = await LangUtility.getString(
      LangVar.healthRecord,
      AppbarViewmodel.instance.currentLang,
    );

    _staff = await LangUtility.getString(
      LangVar.staff,
      AppbarViewmodel.instance.currentLang,
    );

    _admin = await LangUtility.getString(
      LangVar.admin,
      AppbarViewmodel.instance.currentLang,
    );

    _login = await LangUtility.getString(
      LangVar.commonLogin,
      AppbarViewmodel.instance.currentLang,
    );

    _logout = await LangUtility.getString(
      LangVar.commonLogout,
      AppbarViewmodel.instance.currentLang,
    );

    _instance = this;
    notifyListeners();
  }

  String _homePage = "";
  String _userInfo = "";
  String _healthRecord = "";
  String _staff = "";
  String _admin = "";
  String _login = "";
  String _logout = "";

  String get homePage => _homePage;
  String get userInfo => _userInfo;
  String get healthRecord => _healthRecord;
  String get staff => _staff;
  String get admin => _admin;
  String get login => _login;
  String get logout => _logout;

  void setUserInfo(String value) {
    _userInfo = value;
    notifyListeners();
  }

  void setHealthRecord(String value) {
    _healthRecord = value;
    notifyListeners();
  }

  void setStaff(String value) {
    _staff = value;
    notifyListeners();
  }

  void setAdmin(String value) {
    _admin = value;
    notifyListeners();
  }

  Future<void> changeLang(String lang) async {
    _userInfo = await LangUtility.getString(LangVar.userInfo, lang);
    _healthRecord = await LangUtility.getString(LangVar.healthRecord, lang);
    _staff = await LangUtility.getString(LangVar.staff, lang);
    _admin = await LangUtility.getString(LangVar.admin, lang);
    _homePage = await LangUtility.getString(LangVar.homePage, lang);
    _login = await LangUtility.getString(LangVar.commonLogin, lang);
    _logout = await LangUtility.getString(LangVar.commonLogout, lang);
    notifyListeners();
  }
}
