import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_crud_flutter/app/services/api_service.dart';
import 'package:rest_crud_flutter/rest_crud_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(GetStorage());
  Get.lazyPut<ApiService>(() => ApiService(), fenix: true);

  runApp(RestCrudApp());
}
