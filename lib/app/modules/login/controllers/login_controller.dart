import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final _box = Get.find<GetStorage>();

  void login() {
    _box.write("loggedIn", true);
    print(_box.read("loggedIn"));
  }
}
