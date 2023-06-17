import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rest_crud_flutter/app/data/response/sign_up_response.dart';
import 'package:rest_crud_flutter/app/utils/api_const.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal();

  Future<SignUpResponse?> signUp(Map body) async {
    try {
      Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.SIGN_UP);
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          // HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      if (response.statusCode == 200) {
        return SignUpResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Future.error(e);
    }
    return null;
  }
}
