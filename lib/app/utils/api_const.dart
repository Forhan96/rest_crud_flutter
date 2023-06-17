class ApiConstants {
  static const BASE_URL = "http://testapi.alifouad91.com/api";

  static const SIGN_UP = "/user/register";
  static const LOGIN = "/login";
  static const USERS = "/users";
  static const UPDATE_USER = "/user/update";
  static const CHANGE_PASSWORD = "/user/changepassword";
  static const DELETE_USER = "/user/delete";

  static String getUser(String uid) => "/user/$uid";
}
