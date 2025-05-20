import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ltdmed/drawer/drawer_modelview.dart';
import 'package:ltdmed/l10n/langvar.dart';
import 'package:ltdmed/models/base_model.dart';
import 'package:ltdmed/pages/home/home_viewmodel.dart';

class AppbarViewmodel with ChangeNotifier implements BaseModel {
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
    await HomeViewModel.instance.init();
    _instance = this;
    notifyListeners();
  }

  @override
  Future<void> changeLang(String lang) async {
    currentLang = lang;
    title = await LangUtility.getString(LangVar.title, currentLang);
    await DrawerModelView.instance.changeLang(currentLang);
    await HomeViewModel.instance.changeLang(currentLang);
    notifyListeners();
  }

  String currentLang = LangVar.vi;
  List<String> langs = [];
  String title = "";
}
