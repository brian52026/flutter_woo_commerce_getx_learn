import 'package:flutter_woo_commerce_getx_learn/pages/login/index.dart';
import 'package:get/get.dart';

import '../index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.main,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
