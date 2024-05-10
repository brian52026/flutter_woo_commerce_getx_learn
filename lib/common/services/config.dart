
import 'dart:ui';

import '../index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

//配置服務
class ConfigService extends GetxService {
  //這是一個單例寫法
  static ConfigService get to => Get.find();

  Locale locale = PlatformDispatcher.instance.locale;

  PackageInfo? _platform;
  String get version => _platform?.version?? '-';

  //初始化
  Future<ConfigService> init() async{
    await getPlatform();
    return this;
  }
  
  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始語言
  void initLocale(){
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if(langCode.isEmpty)return;
    var index = Translation.supportedLocales.indexWhere((element) => element.languageCode == langCode);
    if (index == -1) return;
    locale = Translation.supportedLocales[index];
  }
  // 更改語言
  void onLocaleUpdate(Locale value){
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  @override
  void onReady(){
    super.onReady();
    initLocale();
  }

}