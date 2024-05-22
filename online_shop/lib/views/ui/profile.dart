import 'package:flutter/cupertino.dart';
import 'package:online_shop/controllers/login_provider.dart';
import 'package:online_shop/services/authhelper.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/export_packages.dart';
import 'package:online_shop/views/ui/auth/login.dart';
import 'package:online_shop/views/ui/nonuser.dart';

import 'package:online_shop/views/ui/shippingadress.dart';
import 'package:online_shop/widgets/reusable_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    return authNotifier.loggeIn == false
        ? const NonUser()
        : Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 75,
                    ),
                    Center(
                      child: FutureBuilder(
                        future: AuthHelpr().getProfile(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: ReusableText(
                                text: "Error getting DATA",
                                style:
                                    appstyle(18, Colors.black, FontWeight.w600),
                              ),
                            );
                          } else {
                            final userData = snapshot.data;
                            return Column(
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 75,
                                ),
                                ReusableText(
                                    text: userData?.username ?? "",
                                    style: appstyle(
                                        20, Colors.black, FontWeight.w600)),
                                ReusableText(
                                    text: userData?.email ?? "",
                                    style: appstyle(
                                        18, Colors.black, FontWeight.normal))
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: const Text(
                        'My Orders',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    const ListTile(
                      title: Text(
                        'My reviews',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      subtitle: Text('Reviews for 4 items'),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    const ListTile(
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      subtitle: Text('Notifications, password'),
                      trailing: Icon(Icons.settings),
                    ),
                    ListTile(
                      title: const Text(
                        'logout',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      ),
                      trailing: const Icon(Icons.logout),
                      onTap: () {
                        authNotifier.logout();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                    ),
                  ]),
                )
              ],
            ),
          );
  }
}
