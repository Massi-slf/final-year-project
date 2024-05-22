import 'package:flutter/material.dart';
import 'package:online_shop/client/views/shared/appstyle.dart';
import 'package:online_shop/client/views/shared/reuseable_text.dart';
import 'package:online_shop/client/widgets/reusable_text.dart';
import 'package:online_shop/seller/models/product.dart';
import 'package:online_shop/seller/screens/products_screen.dart';

class EditProduct extends StatefulWidget {
  final Product product;

  const EditProduct({super.key, required this.product});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.product.name;
    priceController.text = widget.product.price;
    imageUrlController.text = widget.product.images.isNotEmpty ? widget.product.images.first : '';
    categoryController.text = widget.product.category.name;
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFE2E2E2),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network('https://cdn-icons-png.flaticon.com/128/5610/5610944.png'),
              const SizedBox(height: 16.0),
              reusableText(
                  text: "Product Edited Successfully",
                  style: appstyle(12, Colors.black, FontWeight.normal)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreen()),
                );
              },
              child: ReusableText(
                  text: "OK",
                  style: appstyle(12, Colors.black, FontWeight.w600)),
            ),
          ],
        );
      },
    );
  }

  void _onConfirmButtonPressed() {
    if (nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        categoryController.text.isNotEmpty) {
      _showConfirmationDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all data')),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    imageUrlController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: reusableText(
            text: "Edit Product",
            style: appstyle(35, Colors.black, FontWeight.bold)),
        backgroundColor: const Color(0xFFE2E2E2),
      ),
      body: Container(
        color: const Color(0xFFE2E2E2),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: imageUrlController,
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // Update the selected image URL
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  if (imageUrlController.text.isNotEmpty)
                    Image.network(
                      imageUrlController.text,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: _onConfirmButtonPressed,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black, // Text color
                    ),
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
