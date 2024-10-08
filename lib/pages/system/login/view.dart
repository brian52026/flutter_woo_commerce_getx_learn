import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          const HelloWidget(),
          ElevatedButton(
              onPressed: () {
                controller.onTap(DateTime.now().second);
              },
              child: const Text("點我")),
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/splash");
              },
              child: const Text("前往Splash")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("login")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
