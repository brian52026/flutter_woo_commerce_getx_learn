import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'locales/index.dart';

// 詞典
class Translation extends Translations{
  //當前系統語言
  static Locale? get locale => Get.deviceLocale;
  //默認語言 en-us
  static const fallbackLocale = Locale('en','us');
  //支援語言列表
  static const supportedLocales = [
    Locale('en','US'),
    Locale('zh','TW'),
    Locale('zh','CN'),
  ];
  //代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  
  //語言代碼對應的翻譯文本
  @override
  Map<String, Map<String, String>> get keys => {
    'en': localeEn,
    'zh': localeZh,
  };
  

}