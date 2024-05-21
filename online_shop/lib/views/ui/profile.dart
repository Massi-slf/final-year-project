import 'package:flutter/cupertino.dart';
import 'package:online_shop/controllers/login_provider.dart';
import 'package:online_shop/views/shared/export_packages.dart';
import 'package:online_shop/views/ui/auth/login.dart';
import 'package:online_shop/views/ui/nonuser.dart';

import 'package:online_shop/views/ui/shippingadress.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    return authNotifier.loggeIn == false ? const NonUser(): Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 75,
              ),
              const ListTile(
                leading: Icon(Icons.person, size: 40),
                title: Text(
                  'User Name',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
                ),
                subtitle: Text('email@gmail.com'),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text(
                  'My Orders',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
              ListTile(
                title: const Text(
                  'Shipping address',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const ShippingAdress()));
                },
              ),
              const ListTile(
                title: Text(
                  'Coupons',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next),
              ),
              const ListTile(
                title: Text(
                  'My reviews',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                subtitle: Text('Reviews for 4 items'),
                trailing: Icon(Icons.navigate_next),
              ),
              const ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                subtitle: Text('Notifications, password'),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                title: const Text(
                  'logout',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.logout),
                onTap: () {
                  authNotifier.logout();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
