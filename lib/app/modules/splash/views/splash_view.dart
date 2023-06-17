import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/utils/image_const.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      controller.checkLoginStatus();
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageAssets.logo,
          height: 250.h,
        ),
      ),
    );
  }
}
