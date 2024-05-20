import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));


class LoginResponseModel {
    LoginResponseModel({
        required this.id,
        required this.token,
    });

    final String id;
    final String token;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json["_id"],
        token: json["token"],
    );
}
