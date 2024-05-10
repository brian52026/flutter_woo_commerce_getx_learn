import 'package:get/get.dart';

import '../../pages/index.dart';
import '../index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.main,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
