import 'package:online_shop/common/views/ui/profile.dart';
import 'package:online_shop/client/views/shared/export_packages.dart';
import 'package:online_shop/seller/screens/seller_dashboard-screen.dart';


class SellerProfile extends StatelessWidget {
  const SellerProfile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // overall theme and app layout
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
           theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          // sets the homescreen of the app
            home: ProfilePage(),
        );
      }
    );
  }
}