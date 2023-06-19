import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rest_crud_flutter/app/data/response/auth_response.dart';
import 'package:rest_crud_flutter/app/data/response/common_response.dart';
import 'package:rest_crud_flutter/app/data/response/user_response.dart';
import 'package:rest_crud_flutter/app/utils/api_const.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal();

  // Future<AuthResponse?> signUp(Map<String, String> body) async {
  //   try {
  //     Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.SIGN_UP);
  //     http.Response response = await http.post(
  //       url,
  //       body: body,
  //       headers: {
  //         HttpHeaders.acceptHeader: "application/json",
  //         // HttpHeaders.contentTypeHeader: "application/json",
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return AuthResponse.fromJson(jsonDecode(response.body));
  //     }
  //   } catch (e) {
  //     Future.error(e);
  //   }
  //   return null;
  // }

  Future<AuthResponse?> signIn(Map<String, String> body) async {
    try {
      Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.LOGIN);

      http.Request request = http.Request("POST", url);
      request.bodyFields = body;
      request.headers['Accept'] = 'application/json';
      var streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(jsonDecode(response.body));
      } else {
        var body = jsonDecode(response.body);
        return AuthResponse(success: false, message: body["message"]);
      }
    } catch (e) {
      Future.error(e);
    }
    return null;
  }

  Future<AuthResponse?> signUp(Map<String, String> body) async {
    try {
      Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.SIGN_UP);

      http.Request request = http.Request("POST", url);
      request.bodyFields = body;
      request.headers['Accept'] = 'application/json';
      var streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        return AuthResponse.fromJson(jsonDecode(response.body));
      } else {
        var body = jsonDecode(response.body);
        return AuthResponse(success: false, message: body["message"]);
      }
    } catch (e) {
      Future.error(e);
    }
    return null;
  }

  Future<User?> getUser({required String token, required String uid}) async {
    try {
      Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.getUser(uid));
      http.Response response = await http.get(
        url,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: token,
        },
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Future.error(e);
    }
    return null;
  }

  Future<User?> updateUser({required String token, required Map<String, String> body}) async {
    try {
      Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.UPDATE_USER);
      http.Response response = await http.post(
        url,
        body: body,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.authorizationHeader: token,
        },
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Future.error(e);
    }
    return null;
  }

  Future<CommonResponse?> changePassword({required String token, required Map<String, String> body}) async {
    try {
      Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.CHANGE_PASSWORD);
      http.Response response = await http.post(
        url,
        body: body,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.authorizationHeader: token,
        },
      );

      if (response.statusCode == 200) {
        return CommonResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Future.error(e);
    }
    return null;
  }

  Future<CommonResponse?> deleteUser(String token) async {
    try {
      Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.DELETE_USER);
      http.Response response = await http.delete(
        url,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: token,
        },
      );

      if (response.statusCode == 200) {
        return CommonResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Future.error(e);
    }
    return null;
  }
}
