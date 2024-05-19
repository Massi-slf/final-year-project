import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/appstyle.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => TrackOrderPageState();
}

class TrackOrderPageState extends State<TrackOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("track order", style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}