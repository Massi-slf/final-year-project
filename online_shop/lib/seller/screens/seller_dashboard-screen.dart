import 'package:online_shop/client/views/shared/export.dart';
import 'package:online_shop/client/views/shared/export_packages.dart';
import 'package:online_shop/seller/screens/add_product.dart';
import 'package:online_shop/seller/screens/products_screen.dart';
import 'package:online_shop/seller/screens/seller_profile.dart';



class sellerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Seller Dashboard'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                    color: Color.fromARGB(255, 0, 0, 0),
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
                  MaterialPageRoute(builder: (context) => AddProduct()),
                );},
                  child: Container(
                    decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
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
                  MaterialPageRoute(builder: (context) => SellerProfile()),
                );},
                  child: Container(
                    decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
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