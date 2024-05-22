
import 'package:online_shop/client/controllers/login_provider.dart';
import 'package:online_shop/client/views/shared/export.dart';
import 'package:online_shop/client/views/shared/export_packages.dart';
import 'package:online_shop/common/auth/login.dart';
import 'package:online_shop/seller/screens/seller_dashboard-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');

  //method that initializes the app and run top level wigets
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
    ChangeNotifierProvider(create: (context) => ProductNotifier()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context)=> FavoritesNotifier()),
    ChangeNotifierProvider(create: (context)=> LoginNotifier()),
   
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          

          // sets the homescreen of the app
          home: LoginPage(),
        );
      }
    );
  }
}
