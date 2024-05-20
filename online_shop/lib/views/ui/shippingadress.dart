import 'package:flutter/material.dart';

class ShippingAdress extends StatefulWidget {
  const ShippingAdress({super.key});

  @override
  State<ShippingAdress> createState() => ShippingAdressState();
}

class ShippingAdressState extends State<ShippingAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( ),
      body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: <Widget>[
           
            SliverList(
              
              delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 30,
                    ),
                    const Column(
                      
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