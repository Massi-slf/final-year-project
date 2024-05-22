import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_shop/client/views/shared/appstyle.dart';
import 'package:online_shop/client/views/shared/reuseable_text.dart';
import 'package:online_shop/client/widgets/reusable_text.dart';
import 'package:online_shop/seller/models/product.dart';
import 'package:online_shop/seller/screens/products_screen.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _image;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    });
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
                  text: "Product Added Successfully",
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
        categoryController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        _image != null) {
      // Here you would typically send the new product data to your backend service
      Product newProduct = Product(
        name: nameController.text,
        category: Category(name: categoryController.text, id: '', parent: null),
        price: priceController.text,
        images: [_image!.path], id: '', quantity: 3,
      );

      // Show confirmation dialog
      _showConfirmationDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields and select an image')),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    categoryController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: reusableText(
            text: "Add Product",
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
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text(_image != null ? 'Change Image' : 'Pick Image'),
                  ),
                  if (_image != null)
                    Image.file(
                      _image!,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 16.0),
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
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: _onConfirmButtonPressed,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
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
