import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final _box = Get.find<GetStorage>();
  void logOut() {
    _box.erase();
  }
}
