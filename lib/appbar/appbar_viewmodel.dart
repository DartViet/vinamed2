import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ltdmed/drawer/drawer_modelview.dart';
import 'package:ltdmed/l10n/langvar.dart';

class AppbarViewmodel with ChangeNotifier {
  static AppbarViewmodel? _instance;
  static AppbarViewmodel get instance {
    _instance ??= AppbarViewmodel();
    return _instance!;
  }

  Future<void> init() async {
    if (langs.isNotEmpty) {
      return;
    }
    // Simulate a network call
    langs = await LangUtility.getAllLanguages();
    title = await LangUtility.getString(LangVar.title, currentLang);
    await DrawerModelView.instance.init();
    _instance = this;
    notifyListeners();
  }

  void changeLang(String lang) async {
    currentLang = lang;
    title = await LangUtility.getString(LangVar.title, currentLang);
    DrawerModelView.instance.changeLang(currentLang);
    notifyListeners();
  }

  String currentLang = LangVar.vi;
  List<String> langs = [];
  String title = "";
}
