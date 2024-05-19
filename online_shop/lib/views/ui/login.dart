import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop/views/shared/export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  @override
 Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(elevation: 0,
    toolbarHeight: 50.h,
    backgroundColor: Colors.black,),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
      decoration: const BoxDecoration(
        
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage('assets/images/bg.jpg'))
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [reusableText(text: "Welcome!",
         style: appstyle(30, Colors.white, FontWeight.w600))],
      ),
      ),


  );
 }}