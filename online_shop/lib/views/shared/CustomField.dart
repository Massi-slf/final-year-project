import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/appstyle.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.hintText,
    required this.controller, 
    this.validator, 
    this.keyboard,
    this.suffixIcon,
    this.obscureText, this.onEditingComlete,this.prefixIcon,
    
  }) :super(key: key);
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onEditingComlete;
  final bool? obscureText;




  @override
  Widget build(BuildContext context){
    return Container();
  }
}