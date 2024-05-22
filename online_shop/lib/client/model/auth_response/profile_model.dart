import 'dart:convert';

ProfileRes profileResFromJson(String str) => ProfileRes.fromJson(json.decode(str));

String profileResToJson(ProfileRes data) => json.encode(data.toJson());

class ProfileRes {
    ProfileRes({
        required this.id,
        required this.username,
        required this.email,
        required this.user_type,
    });

    final String id;
    final String username;
    final String email;
    final String user_type;

    factory ProfileRes.fromJson(Map<String, dynamic> json) => ProfileRes(
        id: json["id"],
        username: json["username"]?? "null",
        email: json["email"],
        user_type : json ["user_type"],
       
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "user_type" : user_type,
    };
}
