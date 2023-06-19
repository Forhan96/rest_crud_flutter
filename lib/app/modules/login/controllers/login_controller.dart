import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_crud_flutter/app/data/response/auth_response.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/services/api_service.dart';
import 'package:rest_crud_flutter/app/utils/common_utils.dart';

class LoginController extends GetxController {
  final _box = Get.find<GetStorage>();
  final ApiService _apiService = Get.find<ApiService>();

  Future<void> login(Map<String, String> body) async {
    AuthResponse? authResponse = await _apiService.signIn(body);

    if (authResponse?.success == true) {
      _box.write("loggedIn", true);
      _box.write("token", authResponse?.data?.token);
      _box.write("uid", authResponse?.data?.id);
      Get.offNamedUntil(Routes.HOME, (route) => false);
      CommonUtil.showSnackbar(isSuccess: true, message: authResponse?.message ?? "");
    } else {
      CommonUtil.showSnackbar(isSuccess: false, message: authResponse?.message ?? "");
    }
  }
}
