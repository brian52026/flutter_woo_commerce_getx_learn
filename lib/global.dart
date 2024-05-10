import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async{
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      Get.putAsync<ConfigService>(() async => await ConfigService().init() ),
    ]).whenComplete(() {});

    //工具類
    await Storage().init();
  }
}