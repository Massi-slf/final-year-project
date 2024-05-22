import 'package:flutter/material.dart';
import 'package:online_shop/client/views/shared/appstyle.dart';
import 'package:online_shop/client/views/shared/export.dart';
import 'package:online_shop/client/widgets/reusable_text.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFE2E2E2),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                  'https://cdn-icons-png.flaticon.com/128/5610/5610944.png'),
              const SizedBox(height: 16.0),
              reusableText(
                  text: "Order is confirmed"
                      ", wait for our call",
                  style: appstyle(12, Colors.black, FontWeight.normal)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
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
    if (addressController.text.isNotEmpty &&
        zipCodeController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty) {
      _showConfirmationDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all data')),
      );
    }
  }

  @override
  void dispose() {
    addressController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: reusableText(
            text: "Checkout",
            style: appstyle(35, Colors.black, FontWeight.bold)),
        backgroundColor: const Color(0xFFE2E2E2),
      ),
      body: Container(
        color: const Color(0xFFE2E2E2),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Wilaya',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: zipCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
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
    );
  }
}
