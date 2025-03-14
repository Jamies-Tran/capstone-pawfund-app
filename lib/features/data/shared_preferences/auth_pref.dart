import 'package:capstone_pawfund_app/features/data/services/location_service.dart';
import 'package:capstone_pawfund_app/features/data/shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthPref {
  static ILocationService locationService = LocationService();

  static Future<void> setPhone(String phone) async {
    await SharedPreferencesHelper.preferences.setString("phone", phone);
  }

  static String getPhone() {
    return SharedPreferencesHelper.preferences.getString("phone") ?? "";
  }

  static Future<void> setAccountId(String accountId) async {
    await SharedPreferencesHelper.preferences.setString("accountId", accountId);
  }

  static String getAccountId() {
    return SharedPreferencesHelper.preferences.getString("accountId") ?? "";
  }

  static Future<void> setToken(String token) async {
    await SharedPreferencesHelper.preferences.setString("token", token);
  }

  static String getToken() {
    return SharedPreferencesHelper.preferences.getString("token") ?? "";
  }

  // static Future<void> logout() async {
  //   await SharedPreferencesHelper.preferences.clear();
  //   Get.offAllNamed(AuthenticationPage.AuthenticationPageRoute);
  // }

  static Future<bool> getLocationPermission() async {
    try {
      bool? result =
          SharedPreferencesHelper.preferences.getBool("locationPermission");
      if (result != null) {
        return result;
      } else {
        return false;
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      return false;
    }
  }

  static Future<Map<String, dynamic>> getLongLat() async {
    try {
      double? lng;
      double? lat;
      int attempts = 0; // Biến đếm số lần thử
      do {
        lng = SharedPreferencesHelper.preferences.getDouble("longitude");
        lat = SharedPreferencesHelper.preferences.getDouble("latitude");
        if (lng != null && lat != null) {
          Map<String, dynamic> result = {"lng": lng, "lat": lat};
          return result;
        }
        await locationService.getUserCurrentLocation();
        attempts++;
      } while (lng == null && lat == null && attempts < 2);
      Map<String, dynamic> result = {"lng": 0, "lat": 0};
      return result;
    } catch (e) {
      Map<String, dynamic> result = {"lng": 0, "lat": 0};
      return result;
    }
  }

  static Future<void> setNameCus(String nameCus) async {
    await SharedPreferencesHelper.preferences.setString("nameCus", nameCus);
  }

  static String getNameCus() {
    return SharedPreferencesHelper.preferences.getString("nameCus") ?? "";
  }

  static Future<void> setRole(String role) async {
    await SharedPreferencesHelper.preferences.setString("role", role);
  }

  static String getRole() {
    return SharedPreferencesHelper.preferences.getString("role") ?? "";
  }

  static Future<void> setCusId(int cusId) async {
    await SharedPreferencesHelper.preferences.setInt("cusId", cusId);
  }

  static int getCusId() {
    return SharedPreferencesHelper.preferences.getInt("cusId") ?? 0;
  }
}
