

import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/export_packages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,toolbarHeight: 100.h,backgroundColor: Colors.black,elevation: 0,),
      body: Center(
        child: Text("This is Search", style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}