import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/export_packages.dart';
import 'package:online_shop/views/shared/reuseable_text.dart';
import 'package:online_shop/views/ui/auth/login.dart';

class NonUser extends StatefulWidget {
  const NonUser({super.key});

  @override
  State<NonUser> createState() => _NonUserState();
}

class _NonUserState extends State<NonUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                reusableText(
                  text: "Profile",
                  style: appstyle(36, Colors.black, FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button background color
                ),
                onPressed: () {
                  // Navigate to LoginPage when the button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: reusableText(
                  text: "Login",
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
