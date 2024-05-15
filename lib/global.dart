import 'package:flutter/cupertino.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/wp_http.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async{
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      Get.putAsync<ConfigService>(() async => await ConfigService().init() ),
    ]).whenComplete(() {});

    // 工具類
    await Storage().init();

    // 初始化服務
    Get.put<WPHttpService>(WPHttpService());
  }
}