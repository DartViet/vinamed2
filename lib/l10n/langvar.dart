import 'dart:convert';

import 'package:flutter/services.dart';

class LangUtility {
  static Map<String, dynamic> _langJson = {};

  static Future<Map<String, dynamic>> get langJson async {
    if (_langJson.isEmpty) {
      String langStr = await rootBundle.loadString("assets/lang.json");
      _langJson = json.decode(langStr);
    }
    return _langJson;
  }

  static Future<String> getString(String val, String lang) async {
    Map<String, dynamic> langJson = await LangUtility.langJson;

    if (await langJson[val] == null) {
      return val;
    }
    if (langJson[val][lang] == null) {
      return langJson[val][lang] ?? val;
    }
    return langJson[val][lang];
  }

  static getAllLanguages() async {
    Map<String, dynamic> langJson = await LangUtility.langJson;
    List<String> langs = langJson[LangVar.title].keys.toList();
    return langs;
  }
}

class LangVar {
  static String en = "en";
  static String vi = "vi";
  static String zh = "zh";

  static const String title = "title";
  static const String userInfo = "userInfo";
  static const String healthRecord = "healthRecord";
  static const String staff = "staff";
  static const String admin = "admin";
  static const String homePage = "homePage";
  static const String commonLogin = "commonLogin";
  static const String commonLogout = "commonLogout";
}
