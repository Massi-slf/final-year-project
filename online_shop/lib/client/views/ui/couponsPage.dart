import 'package:flutter/material.dart';
import 'package:online_shop/client/views/shared/export_packages.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => CouponsPageState();
}

class CouponsPageState extends State<CouponsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: const Text("My Coupons", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30) ),
      ),
      body: CustomScrollView(
          physics: ClampingScrollPhysics(),
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
                      leading: Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Icon(Icons.discount),
                      ),
                      contentPadding: EdgeInsets.only(top:  10,bottom: 10),
                      title: Padding(padding: EdgeInsets.only(top:10, bottom: 10),
                      child: Text ('A90',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20,color: Colors.white),)),
                      tileColor: Colors.black,
                      
                      
                      
                      
                    ),
                    SizedBox(height: 20,),
                     ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Icon(Icons.discount),
                      ),
                      contentPadding: EdgeInsets.only(top:  10,bottom: 10),
                      title: Padding(padding: EdgeInsets.only(top:10, bottom: 10),
                      child: Text ('HGFHUG',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20,color: Colors.white),)),
                      tileColor: Colors.black,
                      
                      
                      
                      
                    ),
                    
                    ])]
              )
              )
          ]
            )
    );
  }
}