import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final _box = Get.find<GetStorage>();

  bool _isLoggedIn = false;

  void checkLoginStatus() {
    _isLoggedIn = _box.read("loggedIn") ?? false;

    // Navigate to the desired screen based on the login status
    if (_isLoggedIn) {
      Get.offNamedUntil(Routes.HOME, (route) => false);
    } else {
      Get.offNamedUntil(Routes.WELCOME, (route) => false);
    }
  }
}
