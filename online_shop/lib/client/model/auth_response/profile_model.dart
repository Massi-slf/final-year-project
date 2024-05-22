import 'dart:convert';

ProfileRes profileResFromJson(String str) => ProfileRes.fromJson(json.decode(str));

String profileResToJson(ProfileRes data) => json.encode(data.toJson());

class ProfileRes {
    ProfileRes({
        required this.id,
        required this.username,
        required this.email,
    });

    final String id;
    final String username;
    final String email;

    factory ProfileRes.fromJson(Map<String, dynamic> json) => ProfileRes(
        id: json["id"],
        username: json["username"]?? "null",
        email: json["email"],
       
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
    };
}
