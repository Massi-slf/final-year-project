import 'package:online_shop/controllers/login_provider.dart';
import 'package:online_shop/model/auth/login_model.dart';
import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_packages.dart';
import 'package:online_shop/views/ui/auth/registertion.dart';
import 'package:online_shop/widgets/custom_textfield.dart';
import 'package:online_shop/widgets/reusable_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
                text: "Welcome!",
                style: appstyle(30, Colors.white, FontWeight.w600)),
            reusableText(
                text: "Enter the Email and the Password",
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
                          builder: (context) => const Registertion()));
                },
                child: ReusableText(
                    text: "Register",
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
                  LoginModel model =
                      LoginModel(email: email.text, password: password.text);

                  authNotifier.userLogin(model).then(
                    (response) {
                      if (response == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
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
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child: ReusableText(
                      text: "LOGIN",
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
