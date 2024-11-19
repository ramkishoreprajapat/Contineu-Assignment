import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, 
    required this.hintText, 
    required this.obscureText, 
    required this.maxLength, 
    this.controller,
    this.textInputType, 
    this.textCapitalization, 
    this.textInputFormatter,
    this.textInputAction, 
    this.suffixIcon,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final String hintText;
  final bool obscureText;
  final int maxLength;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final IconButton? suffixIcon;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      textInputAction: textInputAction,
      
      decoration: InputDecoration(
        hintText: hintText,
        counterText: "",
        suffixIcon: suffixIcon
      ),
      style: Theme.of(context).textTheme.titleMedium, 
    );
  }
}
