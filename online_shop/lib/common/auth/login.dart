import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/client/controllers/login_provider.dart';
import 'package:online_shop/client/model/auth/login_model.dart';
import 'package:online_shop/client/services/authhelper.dart';
import 'package:online_shop/client/views/shared/export.dart';
import 'package:online_shop/client/views/shared/export_packages.dart';
import 'package:online_shop/common/auth/registertion.dart';
import 'package:online_shop/client/widgets/custom_textfield.dart';
import 'package:online_shop/client/widgets/reusable_text.dart';
import 'package:online_shop/common/auth/registertionseller.dart';
import 'package:online_shop/seller/screens/seller_dashboard-screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool validator = false;

  void formValidator() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        decoration: BoxDecoration(
          image: const DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/images/bg.jpg'),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 100),
            reusableText(
              text: "Welcome!",
              style: appstyle(30, Colors.white, FontWeight.w600),
            ),
            reusableText(
              text: "Enter the Email and the Password",
              style: appstyle(14, Colors.white, FontWeight.normal),
            ),
            SizedBox(height: 50),
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
            SizedBox(height: 15),
            CustomTextField(
              hintText: "password  ",
              controller: password,
              obscureText: !authNotifier.isObsecure,
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registertion(),
                    ),
                  );
                },
                child: ReusableText(
                  text: "Register",
                  style: appstyle(14, Colors.white, FontWeight.normal),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                formValidator();
                if (validator) {
                  LoginModel model =
                      LoginModel(email: email.text, password: password.text);

                  authNotifier.userLogin(model).then(
                    (response) async {
                      if (response == true) {
                        var user = await AuthHelpr().getProfile();
                        if (user.user_type == "client") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  MainScreen(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  sellerScreen(),
                            ),
                          );
                        }
                      } else {
                        debugPrint('Failed To login');
                      }
                    },
                  );
                } else {
                  print('not good');
                }
              },
              child: Container(
                height: 55.5,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: ReusableText(
                    text: "LOGIN",
                    style: appstyle(18, Colors.black, FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Added space for better readability
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  // Navigate to Become a Seller page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistertionSeller()),
                  );
                },
                child: ReusableText(
                  text: "Become a Seller",
                  style: appstyle(14, Colors.white, FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
