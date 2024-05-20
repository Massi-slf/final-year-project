import 'package:flutter/material.dart';
import 'package:online_shop/model/auth/login_model.dart';
import 'package:online_shop/services/authhelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier{
  bool _isObsecure = false ; 
  bool get isObsecure => _isObsecure;
  set isObsecure(bool newState){
    _isObsecure = newState;
    notifyListeners();
  }
    bool _processing = false ; 
  bool get processing => _processing;
  set processing(bool newState){
    _processing = newState;
    notifyListeners();
  }

    bool _loginResponseBool = false ; 
  bool get loginResponseBool => _loginResponseBool;
  set loginResponseBool(bool newState){
    _loginResponseBool = newState;
    notifyListeners();
  }
      bool _responceBool = false ; 
  bool get responceBool => _responceBool;
  set responceBool(bool newState){
    _responceBool = newState;
    notifyListeners();
  }
    bool? _loggeIn; 
  bool get loggeIn => _loggeIn ?? false;
  set loggeIn(bool newState){
    _loggeIn = newState;
    notifyListeners();
  }
Future<bool> userLogin(LoginModel model) async{

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  processing = true;
  bool response = await AuthHelpr().login(model);
  processing = false;
  loginResponseBool = response;
  loggeIn = prefs.getBool('isLogged') ?? false;
  return loginResponseBool;
}

logout() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  prefs.remove('userId');
  prefs.setBool('isLoggout', false);
  loggeIn = prefs.getBool('isLogged') ?? false;



}




}