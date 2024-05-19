
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_shop/views/ui/Trackorders.dart';
import 'dart:developer' as developer;

import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/ui/couponsPage.dart';
import 'package:online_shop/views/ui/shippingadress.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
           
            SliverList(
              
              delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: Icon(Icons.person, size: 40),
                      title: Text('User Name',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),),
                      subtitle: Text('email.gmail.com'),
                      
                      
                    ),
                     SizedBox(
                      height: 10,
                    ),

                    ListTile(
                      
                      title: Text('See Orders State' ,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>TrackOrderPage ()));
                      },
                    ),
                    ListTile(
                      title: Text('Shipping address',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>ShippingAdress ()));
                      },
                    ),
                    ListTile(
                      title: Text('Coupons',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>CouponsPage ()));
                      },
                    ),
                    ListTile(
                      title: Text('My reviews',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                      subtitle: Text('Reviews for 4 items'),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    ListTile(
                      title: Text('Settings',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                      subtitle: Text('Notifications, password'),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    ListTile(
                      title: Text('logout', style: TextStyle(color: Colors.red , fontWeight: FontWeight.w500),),
                      
                    ),
                  ]
              ),
            )
          ],
        ),
      
    );
  }
}