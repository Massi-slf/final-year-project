import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));


class LoginResponseModel {
    LoginResponseModel({
        required this.id,
        required this.access,
    });

    final String id;
    final String access;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json["id"] ?? "noId",
        access: json["access"],
    );
}
