// lib/main.dart
/*import 'package:flutter/material.dart';
import 'package:online_shop/client/views/shared/export.dart';
import 'screens/products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 75, 75, 75),
      appBar: AppBar(
        title: Text('Seller Dashboard'),
        backgroundColor: const Color.fromARGB(255, 59, 59, 59),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          
          primary: false,
          padding: const EdgeInsets.all(50),
          
          
          
          children: <Widget>[
            
            SizedBox(height: 70,),
             InkWell(
              
              
                   onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreen()),
                );},
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.blue,
                     borderRadius: BorderRadius.all(
           Radius.circular(10))
        ),
                    padding: const EdgeInsets.all(40),
                    child: Center(child: const Text('Manage stock',style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),)),
                    
                  ),
             ),
             SizedBox(height: 30,),
              InkWell(
              
                   onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreen()),
                );},
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.blue,
                     borderRadius: BorderRadius.all(
           Radius.circular(10))
        ),
                    padding: const EdgeInsets.all(40),
                    child: Center(child: const Text('Manage orders',style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),)),
                    
                  ),
             ),
             SizedBox(height: 30,),
             InkWell(
              
                   onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreen()),
                );},
                  child: Container(
                    decoration: BoxDecoration(
                    color: Color.fromARGB(255, 119, 128, 136),
                     borderRadius: BorderRadius.all(
           Radius.circular(10))
        ),
                    padding: const EdgeInsets.all(40),
                    child: Center(child: const Text('Profile',style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),)),
                    
                  ),
             ),
            
          ],
        ),
      ),
    );
  }
}
*/
import 'package:online_shop/client/controllers/login_provider.dart';
import 'package:online_shop/client/views/shared/export.dart';
import 'package:online_shop/client/views/shared/export_packages.dart';
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
          title: 'commerce-90',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          // sets the homescreen of the app
          home: sellerScreen(),
        );
      }
    );
  }
}
