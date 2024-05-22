import 'package:flutter/material.dart';
import 'package:online_shop/controllers/login_provider.dart';
import 'package:online_shop/model/auth/signup_model.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/export_packages.dart';
import 'package:online_shop/views/shared/reuseable_text.dart';
import 'package:online_shop/views/ui/auth/login.dart';
import 'package:online_shop/widgets/custom_textfield.dart';
import 'package:online_shop/widgets/reusable_text.dart';

class Registertion extends StatefulWidget {
  const Registertion({super.key});

  @override
  State<Registertion> createState() => _RegistertionState();
}

class _RegistertionState extends State<Registertion> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  bool validator = false;
  void formValidator() {
    if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        username.text.isNotEmpty) {
      validator = true;
    } else {
      validator = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50.h,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.5, image: AssetImage('assets/images/bg.jpg'))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            reusableText(
                text: "Hi!",
                style: appstyle(30, Colors.white, FontWeight.w600)),
            reusableText(
                text: "Sing-up to shop with us 😊",
                style: appstyle(14, Colors.white, FontWeight.normal)),
            SizedBox(
              height: 50.h,
            ),
            CustomTextField(
              keyboard: TextInputType.emailAddress,
              hintText: "Email  ",
              controller: email,
              validator: (email) {
                if (email!.isEmpty && !email.contains("@")) {
                  return "Please Enter Valid Email";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              keyboard: TextInputType.emailAddress,
              hintText: "Username  ",
              controller: username,
              validator: (username) {
                if (username!.isEmpty) {
                  return "Please Enter Valid your username";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              hintText: "password  ",
              controller: password,
              obscureText: authNotifier.isObsecure,
              suffixIcon: GestureDetector(
                onTap: () {
                  authNotifier.isObsecure = !authNotifier.isObsecure;
                },
                child: authNotifier.isObsecure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              validator: (password) {
                if (password!.isEmpty && password.length < 7) {
                  return "password is too weak";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: ReusableText(
                    text: "You already have account ?, LOGIN",
                    style: appstyle(14, Colors.white, FontWeight.normal)),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                formValidator();
                if (validator) {
                  SignupModel model = SignupModel(
                      username: username.text,
                      email: email.text,
                      password: password.text);

                  authNotifier.registerUser(model).then((response) {
                    if (response == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    } else {
                      print('1not valid');
                    }
                  });
                } else {
                  print('2not valid');
                }
              },
              child: Container(
                height: 55.5,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child: ReusableText(
                      text: "SING-UP",
                      style: appstyle(18, Colors.black, FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
