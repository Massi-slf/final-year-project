
import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/appstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is Profile", style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}