import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_crud_flutter/app/data/response/common_response.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/services/api_service.dart';
import 'package:rest_crud_flutter/app/utils/common_utils.dart';

class ChangePasswordController extends GetxController {
  final _box = Get.find<GetStorage>();
  final ApiService _apiService = Get.find<ApiService>();

  Future<void> changePassword(Map<String, String> body) async {
    String token = _box.read("token");

    CommonResponse? response = await _apiService.changePassword(token: token, body: body);
    if (response?.success == true) {
      _box.erase();
      Get.offNamedUntil(Routes.WELCOME, (route) => false);
      CommonUtil.showSnackbar(isSuccess: true, message: response?.message ?? "");
    } else {
      CommonUtil.showSnackbar(isSuccess: false, message: response?.message ?? "");
    }
  }
}
