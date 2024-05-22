import 'package:flutter/material.dart';
import 'package:online_shop/seller/models/product.dart';
import 'package:online_shop/seller/services/api_service.dart';


class ProductScreen extends StatefulWidget {
  @override
  ProductScreenState createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  final ApiService _apiService = ApiService();
  late Future<Map<String, dynamic>> _products;

  @override
  void initState() {
    super.initState();
    _products = _apiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            final productMap = snapshot.data!;
            if (productMap.containsKey('results') && productMap['results'] is List) {
              final products = productMap['results'] as List<dynamic>;
              final productList = products.map<Product>((item) => Product.fromJson(item)).toList();

              return ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  var product = productList[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('${product.description}\nCategory: ${product.category}\nPrice: \$${product.price}\nQuantity: ${product.quintity}'),
                  );
                },
              );
            } else {
              return Center(child: Text('No products found'));
            }
          }
        },
      ),
    );
  }
}
