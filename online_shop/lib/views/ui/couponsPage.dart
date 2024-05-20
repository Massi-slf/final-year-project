import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/export_packages.dart';

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
        title: Text("My Coupons", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30) ),
      ),
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
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Icon(Icons.discount),
                      ),
                      contentPadding: EdgeInsets.only(top:  10,bottom: 10),
                      title: Padding(padding: const EdgeInsets.only(top:10, bottom: 10),
                      child: Text ('A90',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20,color: Colors.white),)),
                      tileColor: Colors.black,
                      
                      
                      
                      
                    ),
                    SizedBox(height: 20,),
                     ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Icon(Icons.discount),
                      ),
                      contentPadding: EdgeInsets.only(top:  10,bottom: 10),
                      title: Padding(padding: const EdgeInsets.only(top:10, bottom: 10),
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