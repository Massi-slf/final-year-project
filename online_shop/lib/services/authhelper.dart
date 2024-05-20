import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_shop/model/auth/login_model.dart';
import 'package:online_shop/model/auth/signup_model.dart';
import 'package:online_shop/model/auth_response/login_res_model.dart';
import 'package:online_shop/model/auth_response/profile_model.dart';
import 'package:online_shop/models/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelpr {
  static var client = http.Client();

  Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application.json'};
    var url = Uri.http(Config.apiUrl, Config.loginUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String userToken = loginResponseModelFromJson(response.body).token;
      String userID = loginResponseModelFromJson(response.body).id;

      await prefs.setString('token', userToken);
      await prefs.setString('userID', userID);
      await prefs.setBool('isLogged', true);

      return true;
    } else {
      return false;
    }
  }

  Future<bool> singup(SignupModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application.json'};
    var url = Uri.http(Config.apiUrl, Config.signupUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<ProfileRes> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Constent-Type': 'application.json',
      'token': 'Bearer $userToken'
    };
    var url = Uri.http(Config.apiUrl, Config.getUserUrl);
    var response = await client.post(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var profile = profileResFromJson(response.body);

      return profile;
    } else {
      throw Exception("Fialed get the profile data");
    }
  }
}
