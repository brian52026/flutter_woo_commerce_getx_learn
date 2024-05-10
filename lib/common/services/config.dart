
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

//配置服務
class ConfigService extends GetxService {
  //這是一個單例寫法
  static ConfigService get to => Get.find();

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


}