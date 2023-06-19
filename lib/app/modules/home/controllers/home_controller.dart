import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_crud_flutter/app/data/response/auth_response.dart';
import 'package:rest_crud_flutter/app/data/response/common_response.dart';
import 'package:rest_crud_flutter/app/data/response/user_response.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/services/api_service.dart';
import 'package:rest_crud_flutter/app/utils/common_utils.dart';

class HomeController extends GetxController {
  final _box = Get.find<GetStorage>();

  final ApiService _apiService = Get.find<ApiService>();

  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    String token = _box.read("token");
    String uid = _box.read("uid");
    User? response = await _apiService.getUser(token: token, uid: uid);

    if (response?.success == true) {
      name.value = response?.data?.name ?? "";
      phone.value = "${response?.data?.countryCode ?? ""}${response?.data?.phone ?? ""}";
      email.value = response?.data?.email ?? "";
      update();
    } else {
      CommonUtil.showSnackbar(isSuccess: false, message: response?.message ?? "");
    }
  }

  Future<void> deleteAccount() async {
    String token = _box.read("token");
    CommonResponse? response = await _apiService.deleteUser(token);

    if (response?.success == true) {
      _box.erase();
      Get.offNamedUntil(Routes.WELCOME, (route) => false);
      CommonUtil.showSnackbar(isSuccess: true, message: response?.message ?? "");
    } else {
      CommonUtil.showSnackbar(isSuccess: false, message: response?.message ?? "");
    }
  }

  void logOut() {
    _box.erase();
    Get.offNamedUntil(Routes.WELCOME, (route) => false);
  }
}
