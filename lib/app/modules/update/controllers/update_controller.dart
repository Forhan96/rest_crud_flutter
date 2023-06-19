import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_crud_flutter/app/data/response/user_response.dart';
import 'package:rest_crud_flutter/app/services/api_service.dart';
import 'package:rest_crud_flutter/app/utils/common_utils.dart';

class UpdateController extends GetxController {
  final _box = Get.find<GetStorage>();

  final ApiService _apiService = Get.find<ApiService>();

  String name = '';
  String countryCode = '';
  String phone = '';
  String email = '';

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
      name = response?.data?.name ?? "";
      countryCode = response?.data?.countryCode ?? "";
      phone = response?.data?.phone ?? "";
      email = response?.data?.email ?? "";
      update();
    } else {
      CommonUtil.showSnackbar(isSuccess: false, message: response?.message ?? "");
    }
  }

  Future<void> updateUser(Map<String, String> body) async {
    String token = _box.read("token");

    User? response = await _apiService.updateUser(token: token, body: body);
    if (response?.success == true) {
      name = response?.data?.name ?? "";
      phone = response?.data?.phone ?? "";
      email = response?.data?.email ?? "";
      update();
      Get.back(result: true);
    } else {
      CommonUtil.showSnackbar(isSuccess: false, message: response?.message ?? "");
    }
  }
}
