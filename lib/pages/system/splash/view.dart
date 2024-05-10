import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Text("SplashPage = ${ConfigService.to.version}"),
        GetBuilder<SplashController>(
          id: "splash_title",
          builder: (_) {
            return Center(
              child: Text(controller.title),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            controller.onTap(DateTime.now().microsecondsSinceEpoch);
          },
          child: const Text("現在點擊"),
        ),
        ElevatedButton(onPressed: () {Get.toNamed(RouteNames.stylesStylesIndex);}, child: const Text("前往StylesIndex"))
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("splash")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
