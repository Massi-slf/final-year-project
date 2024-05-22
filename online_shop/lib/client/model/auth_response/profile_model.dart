import 'dart:convert';

ProfileRes profileResFromJson(String str) => ProfileRes.fromJson(json.decode(str));

String profileResToJson(ProfileRes data) => json.encode(data.toJson());

class ProfileRes {
    ProfileRes({
        required this.id,
        required this.username,
        required this.email,
        required this.location,
    });

    final String id;
    final String username;
    final String email;
    final String location;

    factory ProfileRes.fromJson(Map<String, dynamic> json) => ProfileRes(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        location: json["location"],
       
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "location": location,
    };
}
