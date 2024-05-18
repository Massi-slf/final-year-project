import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/appstyle.dart';

class ShippingAdress extends StatefulWidget {
  const ShippingAdress({super.key});

  @override
  State<ShippingAdress> createState() => ShippingAdressState();
}

class ShippingAdressState extends State<ShippingAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
           
            SliverList(
              
              delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      
                      children: [
                    ListTile(
                      
                      title: Text('adress',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),),
                      subtitle: Text('el alia biskra'),
                      trailing: Icon(Icons.edit),
                      
                      
                    ),])]
              )
              )
          ]
            )
    );
  }
}