import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar_viewmodel.dart';
import 'package:ltdmed/l10n/langvar.dart';
import 'package:ltdmed/models/base_model.dart';

class HomeViewModel with ChangeNotifier implements BaseModel {
  static HomeViewModel? _instance;
  static HomeViewModel get instance {
    _instance ??= HomeViewModel();
    return _instance!;
  }

  String _title = "";
  String _userInfo = "";
  String _healthRecord = "";
  String _staff = "";
  String _admin = "";

  String get title => _title;
  String get userInfo => _userInfo;
  String get healthRecord => _healthRecord;
  String get staff => _staff;
  String get admin => _admin;

  Future<void> init() async {
    // Simulate a network call
    String currentLang = AppbarViewmodel.instance.currentLang;
    _title = await LangUtility.getString(LangVar.homePage, currentLang);
    _userInfo = await LangUtility.getString(LangVar.userInfo, currentLang);
    _healthRecord = await LangUtility.getString(
      LangVar.healthRecord,
      currentLang,
    );
    _staff = await LangUtility.getString(LangVar.staff, currentLang);
    _admin = await LangUtility.getString(LangVar.admin, currentLang);
    notifyListeners();
  }

  @override
  Future<void> changeLang(String lang) async {
    _title = await LangUtility.getString(LangVar.homePage, lang);
    _userInfo = await LangUtility.getString(LangVar.userInfo, lang);
    _healthRecord = await LangUtility.getString(LangVar.healthRecord, lang);
    _staff = await LangUtility.getString(LangVar.staff, lang);
    _admin = await LangUtility.getString(LangVar.admin, lang);
    notifyListeners();
  }
}
